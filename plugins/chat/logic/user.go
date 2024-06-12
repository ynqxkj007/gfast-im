package logic

import (
	"context"
	"errors"
	"fmt"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/gorilla/websocket"
	"sync"
	"time"
)

type UID string

// 系统用户
var System = &User{UID: "", IsSys: 1, Payload: map[string]interface{}{"uid": "", "nickname": "管理员"}}

type User struct {
	UID            UID                    `json:"uid"`
	EnterAt        MyCustomTime           `json:"enterAt"`
	Addr           string                 `json:"addr"`
	Payload        map[string]interface{} `json:"payload"`
	IsSys          int                    `json:"isSys"` // 1 表示系统用户
	open           bool                   `json:"-"`
	rwmutex        *sync.RWMutex          `json:"-"`
	conn           *websocket.Conn        `json:"-"`
	messageChannel chan *Message          `json:"-"`
	spadger        *Spadger               `json:"-"`
	next           *User                  `json:"-"`
}

func (u *User) ExistNext() bool {
	return u.next != nil
}

func (u *User) Add(other *User) {
	if u.next == nil {
		u.next = other
	} else {
		u.next.Add(other)
	}
}

func (u *User) Remove(fn func(*User) bool) *User {
	u.RemoveNext(fn)
	if fn(u) {
		return u.next
	} else {
		return u
	}
}

func (u *User) RemoveNext(fn func(*User) bool) {
	if u.next == nil {
		return
	}
	if fn(u.next) {
		u.next = u.next.next
	}
	if u.next != nil {
		u.next.RemoveNext(fn)
	}
}

func (u *User) Find(fn func(*User) bool) *User {
	if fn(u) {
		return u
	} else {
		if u.next != nil {
			return u.next.Find(fn)
		} else {
			return nil
		}
	}
}

func (u *User) Each(fn func(*User)) {
	fn(u)
	if u.next != nil {
		u.next.Each(fn)
	}
}

func (u *User) UIDToUint64() uint64 {
	return gconv.Uint64(u.UID)
}

func NewUser(conn *websocket.Conn, spadger *Spadger, uid string) *User {
	return &User{
		UID:            UID(uid),
		EnterAt:        MyCustomTime(time.Now()),
		Addr:           "",
		open:           true,
		rwmutex:        &sync.RWMutex{},
		conn:           conn,
		messageChannel: make(chan *Message, spadger.Config.MessageBufferSize),
		spadger:        spadger,
	}
}

func (u *User) IsEmpty() bool {
	return u == nil || (u.UID == "" && u.IsSys == 0)
}

func (u *User) IsSysUser() bool {
	return u != nil && u.IsSys == 1
}

func (u *User) Set(key string, value interface{}) {
	if u.Payload == nil {
		u.Payload = make(map[string]interface{})
	}

	u.Payload[key] = value
}

func (u *User) Get(key string) (value interface{}, exists bool) {
	if u.Payload != nil {
		value, exists = u.Payload[key]
	}

	return
}

func (u *User) Write(m *Message) (err error) {
	if u.closed() {
		return errors.New(fmt.Sprintf("write error,ID:%s is closed", m.User.UID))
	}
	u.messageChannel <- m
	return
}

func (u *User) ping() {
	_ = u.writeRaw(&envelope{t: websocket.PingMessage, msg: []byte{}})
}

func (u *User) SendMessage() {
	ticker := time.NewTicker(u.spadger.Config.PingPeriod)
	defer ticker.Stop()

loop:
	for {
		select {
		case msg, ok := <-u.messageChannel:
			if !ok {
				break loop
			}

			g.Log().Debug(context.TODO(), "sendMessage:", msg)
			err := u.writeRaw(&envelope{t: websocket.TextMessage, msg: msg.Json()})

			if err != nil {
				u.spadger.errorHandler(u, err)
				break loop
			}

			u.spadger.messageSentHandler(u, *msg)

		case <-ticker.C:
			u.ping()
		}
	}
}

func (u *User) ReceiveMessage() {
	u.conn.SetReadLimit(u.spadger.Config.MaxMessageSize)
	_ = u.conn.SetReadDeadline(time.Now().Add(u.spadger.Config.PongWait))

	u.conn.SetPongHandler(func(string) error {
		_ = u.conn.SetReadDeadline(time.Now().Add(u.spadger.Config.PongWait))
		u.spadger.pongHandler(u)
		return nil
	})

	if u.spadger.closeHandler != nil {
		u.conn.SetCloseHandler(func(code int, text string) error {
			return u.spadger.closeHandler(u, code, text)
		})
	}

	for {
		var t int
		var message []byte
		var err error
		t, message, err = u.conn.ReadMessage()

		if err != nil {
			u.spadger.errorHandler(u, err)
			break
		}

		sendMsg := NewMessageByLetter(u, NewLetter(message))
		if t == websocket.TextMessage {
			u.spadger.messageHandler(u, *sendMsg)
		}
		g.Log().Debug(context.TODO(), "receiveMessage:", sendMsg)
		u.spadger.Hub.Broadcast(sendMsg)
	}
}

func (u *User) Close() {
	if !u.closed() {
		u.rwmutex.Lock()
		u.open = false
		_ = u.conn.Close()
		close(u.messageChannel)
		u.rwmutex.Unlock()
	}
}

func (u *User) closed() bool {
	u.rwmutex.RLock()
	defer u.rwmutex.RUnlock()
	return !u.open
}

func (u *User) writeRaw(message *envelope) error {
	if u.closed() {
		return errors.New("tried to write to a closed session")
	}

	err := u.conn.SetWriteDeadline(time.Now().Add(u.spadger.Config.WriteWait))
	if err != nil {
		return err
	}
	err = u.conn.WriteMessage(message.t, message.msg)
	if err != nil {
		return err
	}

	return nil
}
