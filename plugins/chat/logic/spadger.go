package logic

import (
	"github.com/gorilla/websocket"
	"github.com/tiger1103/gfast/v3/plugins/chat/config"
	"net/http"
)

type handleMessageFunc func(*User, Message)
type handleErrorFunc func(*User, error)
type handleCloseFunc func(*User, int, string) error
type handleSessionFunc func(*User)
type filterFunc func(*User) bool

type Spadger struct {
	Config                   *config.Config
	Upgrader                 *websocket.Upgrader
	messageHandler           handleMessageFunc
	messageHandlerBinary     handleMessageFunc
	messageSentHandler       handleMessageFunc
	messageSentHandlerBinary handleMessageFunc
	errorHandler             handleErrorFunc
	closeHandler             handleCloseFunc
	connectHandler           handleSessionFunc
	disconnectHandler        handleSessionFunc
	pongHandler              handleSessionFunc
	Hub                      *Broadcaster
}

func NewSpadger() *Spadger {
	upgrader := &websocket.Upgrader{
		ReadBufferSize:  1024,
		WriteBufferSize: 1024,
		CheckOrigin:     func(r *http.Request) bool { return true },
	}
	hub := NewBroadcaster()
	go hub.Start()
	return &Spadger{
		Config:                   config.NewConfig(),
		Upgrader:                 upgrader,
		messageHandler:           func(*User, Message) {},
		messageHandlerBinary:     func(*User, Message) {},
		messageSentHandler:       func(*User, Message) {},
		messageSentHandlerBinary: func(*User, Message) {},
		errorHandler:             func(*User, error) {},
		closeHandler:             nil,
		connectHandler:           func(*User) {},
		disconnectHandler:        func(*User) {},
		pongHandler:              func(*User) {},
		Hub:                      hub,
	}
}

func (s *Spadger) HandleConnect(fn func(*User)) {
	s.connectHandler = fn
}

func (s *Spadger) HandleDisconnect(fn func(*User)) {
	s.disconnectHandler = fn
}

func (s *Spadger) HandlePong(fn func(*User)) {
	s.pongHandler = fn
}

func (s *Spadger) HandleMessage(fn func(*User, Message)) {
	s.messageHandler = fn
}

func (s *Spadger) HandleMessageBinary(fn func(*User, Message)) {
	s.messageHandlerBinary = fn
}

func (s *Spadger) HandleSentMessage(fn func(*User, Message)) {
	s.messageSentHandler = fn
}

func (s *Spadger) HandleSentMessageBinary(fn func(*User, Message)) {
	s.messageSentHandlerBinary = fn
}

func (s *Spadger) HandleError(fn func(*User, error)) {
	s.errorHandler = fn
}

func (s *Spadger) HandleClose(fn func(*User, int, string) error) {
	if fn != nil {
		s.closeHandler = fn
	}
}

func (s *Spadger) HandleRequest(w http.ResponseWriter, r *http.Request, uid string) error {
	return s.HandleRequestWithKeys(w, r, uid, nil)
}

func (s *Spadger) HandleRequestWithKeys(w http.ResponseWriter, r *http.Request, uid string, keys map[string]interface{}) error {
	conn, err := s.Upgrader.Upgrade(w, r, nil)
	if err != nil {
		return err
	}
	user := NewUser(conn, s, uid)
	if keys != nil {
		user.Payload = keys
	}
	s.connectHandler(user)
	if !user.open {
		return nil
	}
	s.Hub.Broadcast(NewUserEnterMessage(user))
	s.Hub.UserEntering(user)
	go user.SendMessage()
	user.ReceiveMessage()
	user.Close()
	s.Hub.UserLeaving(user)
	s.disconnectHandler(user)
	s.Hub.Broadcast(NewUserLeaveMessage(user))
	return nil
}
