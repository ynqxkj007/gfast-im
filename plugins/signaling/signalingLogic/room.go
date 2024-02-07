package signalingLogic

import (
	"log"
	"sync"
)

type Rooms struct {
	rooms map[string][]*UserInfo
	mx    sync.RWMutex
	limit int
}

func NewRooms() *Rooms {
	return &Rooms{
		rooms: make(map[string][]*UserInfo),
		mx:    sync.RWMutex{},
		limit: 10,
	}
}

func (r *Rooms) Remove(roomId string, u *UserInfo) {
	r.mx.Lock()
	defer r.mx.Unlock()
	var temp []*UserInfo
	if users, ok := r.rooms[roomId]; ok {
		for _, item := range users {
			if item.ID != u.ID {
				temp = append(temp, item)
			}
		}
		if len(temp) > 0 {
			r.rooms[roomId] = temp
		} else {
			delete(r.rooms, roomId)
		}
	}
}

func (r *Rooms) isEmpty() bool {
	return len(r.rooms) == 0
}

func (r *Rooms) GetRooms() (result map[string][]UserInfo) {
	r.mx.RLock()
	defer r.mx.RUnlock()
	if r.isEmpty() {
		return
	}
	result = make(map[string][]UserInfo)
	for key, item := range r.rooms {
		var users []UserInfo
		for _, user := range item {
			users = append(users, *user)
		}
		result[key] = users
	}
	return
}

func (r *Rooms) AddUserAndCreateRoom(roomId string, u *UserInfo) {
	r.mx.Lock()
	defer r.mx.Unlock()
	if _, ok := r.rooms[roomId]; ok {
		r.rooms[roomId] = append(r.rooms[roomId], u)
	} else {
		r.rooms[roomId] = []*UserInfo{u}
	}
}

// 是否超员
func (r *Rooms) IsOverLoad(roomId string) bool {
	r.mx.RLock()
	defer r.mx.RUnlock()
	if _, ok := r.rooms[roomId]; ok && len(r.rooms[roomId]) > r.limit {
		return true
	}

	return false

}

func (r *Rooms) Broadcast(roomId string, msg []byte, filterFns ...func(*UserInfo) bool) {
	r.mx.RLock()
	defer r.mx.RUnlock()
	if users, ok := r.rooms[roomId]; ok {
		for _, item := range users {
			if len(filterFns) > 0 {
				if filterFns[0](item) {
					err := item.Session.Write(msg)
					if err != nil {
						log.Println("Rooms.Broadcast err:", err)
					}
				}
			} else {
				err := item.Session.Write(msg)
				if err != nil {
					log.Println("Rooms.Broadcast err:", err)
				}
			}
		}
	}
}
