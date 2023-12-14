package model

import (
	"context"
	"database/sql"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/tiger1103/gfast/v3/internal/app/chat/dao"
	"github.com/tiger1103/gfast/v3/internal/app/chat/model/do"
	"github.com/tiger1103/gfast/v3/internal/app/chat/model/entity"
)

type MessageRoomSuperList []*MessageRoomSuper
type MessageRoomSuperListErr struct {
	MessageRoomSuperList
	Err error
}

func NewMessageRoomSuperList() MessageRoomSuperList {
	return MessageRoomSuperList{}
}

func (list *MessageRoomSuperList) Find(handler ...gdb.ModelHandler) (err error) {
	err = dao.MessageRoom.Ctx(context.TODO()).Handler(handler...).Scan(list)
	return
}

func (list MessageRoomSuperList) IsEmpty() bool {
	return len(list) == 0
}

func (list MessageRoomSuperList) AllMessageRoomMemberSuperList() (result MessageRoomMemberSuperList) {
	if list.IsEmpty() {
		return
	}

	for _, item := range list {
		result = append(result, item.MessageRoomMemberSuperList...)
	}
	return
}

func (list MessageRoomSuperList) LoadMessageRoomMemberSuperList() (result MessageRoomSuperListErr) {
	if list.IsEmpty() {
		return MessageRoomSuperListErr{}
	}

	err := g.DB().Model("message_room_member").
		Where("room_id", gdb.ListItemValuesUnique(list, "MessageRoom", "Id")).
		ScanList(&list, "MessageRoomMemberSuperList", "MessageRoom", "room_id:Id")
	if err != nil {
		g.Log().Error(context.TODO(), err)
	}

	return MessageRoomSuperListErr{
		MessageRoomSuperList: list,
		Err:                  err,
	}
}

type MessageRoomSuper struct {
	entity.MessageRoom
	MessageRoomMemberSuperList MessageRoomMemberSuperList `json:"messageRoomMemberSuperList"`
}

func NewMessageRoomSuper() *MessageRoomSuper {
	return &MessageRoomSuper{}
}

func (m *MessageRoomSuper) Collection() (result MessageRoomSuperList) {
	if m.IsEmpty() {
		return
	}
	return MessageRoomSuperList{m}
}

func (m *MessageRoomSuper) Delete() (i int64, err error) {
	if m == nil {
		return
	}
	var result sql.Result
	result, err = dao.MessageRoom.Ctx(context.TODO()).Where("id = ?", m.Id).Unscoped().Delete()
	if err != nil {
		return
	}
	i, err = result.RowsAffected()
	if err != nil {
		return
	}
	return
}

func (m *MessageRoomSuper) FindByIdentify(identify string) (err error) {
	return m.Find(func(m *gdb.Model) *gdb.Model {
		return m.Where("identify = ?", identify)
	})
}

func (m *MessageRoomSuper) FindById(id uint64) (err error) {
	return m.Find(func(m *gdb.Model) *gdb.Model {
		return m.Where("id = ?", id)
	})
}

func (m *MessageRoomSuper) Find(handler ...gdb.ModelHandler) (err error) {
	err = dao.MessageRoom.Ctx(context.TODO()).Handler(handler...).Scan(m)
	return
}

func (m *MessageRoomSuper) IsEmpty() bool {
	return m == nil || m.Id == 0
}

func (m *MessageRoomSuper) Add() (err error) {
	var lastId int64
	lastId, err = dao.MessageRoom.Ctx(context.TODO()).Data(do.MessageRoom{
		Name:     m.Name,
		Identify: m.Identify,
	}).InsertAndGetId()
	if err != nil {
		return
	}
	m.Id = uint64(lastId)
	return
}

func (m *MessageRoomSuper) Update(fields ...string) (err error) {
	if m.IsEmpty() {
		return
	}
	gd := dao.MessageRoom.Ctx(context.TODO())
	if len(fields) > 0 {
		gd = gd.Fields(fields[0])
	}
	_, err = gd.Data(m).Where("id=?", m.Id).Update()
	return
}

//func (m *MessageRoomSuper) Delete() (err error) {
//	if m.IsEmpty() {
//		return
//	}
//	_, err = dao.MessageRoom.Ctx(context.TODO()).Where("id=?", m.Id).Delete()
//	return
//}
