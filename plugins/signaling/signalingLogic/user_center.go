package signalingLogic

import (
	signailing "github.com/tiger1103/gfast/v3/plugins/signaling/signaling"
	"sync"
)

type UserCenter struct {
	Rooms *Rooms
	users map[*signailing.Session]*UserInfo
	mx    sync.RWMutex
}

func NewUserCenter() *UserCenter {
	return &UserCenter{
		users: make(map[*signailing.Session]*UserInfo),
		Rooms: NewRooms(),
		mx:    sync.RWMutex{},
	}
}

func (uc *UserCenter) RemoveAll(roomId string, s *signailing.Session) {
	uc.mx.Lock()
	defer uc.mx.Unlock()

	if userInfo, ok := uc.users[s]; ok {
		delete(uc.users, s)
		uc.Rooms.Remove(roomId, userInfo)
	}
}

func (uc *UserCenter) isEmpty() bool {
	return len(uc.users) == 0
}

func (uc *UserCenter) GetUsers() (result []UserInfo) {
	uc.mx.RLock()
	defer uc.mx.RUnlock()
	if uc.isEmpty() {
		return
	}
	for _, item := range uc.users {
		result = append(result, *item)
	}
	return
}

func (uc *UserCenter) Filter(fn func(*UserInfo) bool) (result UserInfoList) {
	uc.mx.RLock()
	defer uc.mx.RUnlock()
	for _, item := range uc.users {
		if fn(item) {
			result = append(result, item)
		}
	}
	return
}

func (uc *UserCenter) IsExist(userId string) bool {
	uc.mx.RLock()
	defer uc.mx.RUnlock()
	for _, item := range uc.users {
		if item.ID == userId {
			return true
		}
	}
	return false
}

func (uc *UserCenter) AddUser(s *signailing.Session, u *UserInfo) {
	uc.mx.Lock()
	defer uc.mx.Unlock()
	uc.users[s] = u
	return
}
