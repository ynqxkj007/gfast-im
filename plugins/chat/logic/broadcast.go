package logic

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
)

type Broadcaster struct {
	users               map[UID]*User
	enteringChannel     chan *User
	leavingChannel      chan *User
	messageChannel      chan *Message
	hasUserChannel      chan UID
	hasUserChannelRes   chan bool
	getUserChannel      chan UID
	getUserChannelRes   chan User
	requestUsersChannel chan chan []User
	offlineProcessor    *offlineProcessor
}

func NewBroadcaster() *Broadcaster {
	return &Broadcaster{
		users:               make(map[UID]*User),
		enteringChannel:     make(chan *User),
		leavingChannel:      make(chan *User),
		messageChannel:      make(chan *Message, 1024),
		hasUserChannel:      make(chan UID),
		hasUserChannelRes:   make(chan bool),
		getUserChannel:      make(chan UID),
		getUserChannelRes:   make(chan User),
		requestUsersChannel: make(chan chan []User),
		offlineProcessor:    newOfflineProcessor(),
	}
}

func (b *Broadcaster) Start() {
	for {
		select {
		case user := <-b.enteringChannel:
			b.users[user.UID] = user
			// 获取离线消息
			b.offlineProcessor.Send(user)
		case user := <-b.leavingChannel:
			delete(b.users, user.UID)
		case msg := <-b.messageChannel:
			if len(msg.Ats) > 0 {
				for _, uid := range msg.Ats {
					if uid == msg.User.UID {
						continue
					}
					if user, ok := b.users[uid]; ok {
						err := user.Write(msg)
						if err != nil {
							g.Log().Info(context.TODO(), err.Error())
						}
					} else {
						b.offlineProcessor.save(uid, msg)
					}
				}
			} else if msg.Filter != nil {
				for _, user := range b.users {
					if user.UID == msg.User.UID {
						continue
					}
					if msg.Filter(user) {
						err := user.Write(msg)
						if err != nil {
							g.Log().Info(context.TODO(), err.Error())
						}
					}
				}
			} else {
				for _, user := range b.users {
					if user.UID == msg.User.UID {
						continue
					}
					err := user.Write(msg)
					if err != nil {
						g.Log().Info(context.TODO(), err.Error())
					}
				}
			}
		case uid := <-b.hasUserChannel:
			if _, ok := b.users[uid]; ok {
				b.hasUserChannelRes <- true
			} else {
				b.hasUserChannelRes <- false
			}

		case uid := <-b.getUserChannel:
			if u, ok := b.users[uid]; ok {
				b.getUserChannelRes <- *u
			} else {
				b.getUserChannelRes <- User{}
			}
		case replyChan := <-b.requestUsersChannel:
			var users = make([]User, 0, len(b.users))
			for _, item := range b.users {
				users = append(users, *item)
			}
			replyChan <- users
		}
	}
}

func (b *Broadcaster) UserEntering(u *User) {
	b.enteringChannel <- u
}

func (b *Broadcaster) UserLeaving(u *User) {
	b.leavingChannel <- u
}

func (b *Broadcaster) Broadcast(msg *Message) {
	b.messageChannel <- msg
}

// 用户是否存在
func (b *Broadcaster) HasUser(uid UID) bool {
	b.hasUserChannel <- uid
	return <-b.hasUserChannelRes
}

// 获取用户列表
func (b *Broadcaster) GetUserList() []User {
	replyChan := make(chan []User, 1)
	b.requestUsersChannel <- replyChan
	return <-replyChan
}

// 查找用户
func (b *Broadcaster) GetUser(uid UID) User {
	b.getUserChannel <- uid
	return <-b.getUserChannelRes
}
