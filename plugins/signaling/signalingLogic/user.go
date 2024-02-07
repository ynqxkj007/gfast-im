package signalingLogic

import signailing "github.com/tiger1103/gfast/v3/plugins/signaling/signaling"

type UserInfo struct {
	ID      string              `json:"id"`
	Session *signailing.Session `json:"-"`
}

type UserInfoList []*UserInfo

func (list UserInfoList) IsEmpty() bool {
	return len(list) == 0
}

func (list UserInfoList) Sessions() []*signailing.Session {
	var sessions []*signailing.Session
	for _, user := range list {
		sessions = append(sessions, user.Session)
	}
	return sessions
}
