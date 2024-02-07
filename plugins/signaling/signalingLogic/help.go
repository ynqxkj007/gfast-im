package signalingLogic

import "github.com/tiger1103/gfast/v3/plugins/signaling/signaling"

type SessionHelp struct {
	*signaling.Session
}

func NewSessionHelp(s *signaling.Session) *SessionHelp {
	return &SessionHelp{
		Session: s,
	}
}

func (s *SessionHelp) GetString(key string) string {
	if v, ok := s.Get(key); ok {
		return v.(string)
	}
	return ""
}

func (s *SessionHelp) GetRoomId() string {
	return s.GetString("roomId")
}

func (s *SessionHelp) GetUserId() string {
	return s.GetString("userId")
}
