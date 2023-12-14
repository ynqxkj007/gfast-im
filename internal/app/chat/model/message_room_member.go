package model

import (
	"context"
	"database/sql"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/tiger1103/gfast/v3/internal/app/chat/dao"
	"github.com/tiger1103/gfast/v3/internal/app/chat/model/entity"
)

type MessageRoomMemberSuper struct {
	entity.MessageRoomMember
	SysUserSuper *SysUserSuper `json:"sysUserSuper"`
}

func NewMessageRoomMember() *MessageRoomMemberSuper {
	return &MessageRoomMemberSuper{}
}

func (m *MessageRoomMemberSuper) IsEmpty() bool {
	return m == nil || m.MessageRoomMember.Id == 0
}

func (m *MessageRoomMemberSuper) Collection() (result MessageRoomMemberSuperList) {
	if m.IsEmpty() {
		return
	}
	return MessageRoomMemberSuperList{m}
}

func (m *MessageRoomMemberSuper) Delete() (i int64, err error) {
	if m != nil && m.RoomId > 0 && m.UserId > 0 {
		var result sql.Result
		result, err = dao.MessageRoomMember.Ctx(context.TODO()).Where("room_id = ? and user_id = ?", m.RoomId, m.UserId).Delete()
		if err != nil {
			return
		}
		i, err = result.RowsAffected()
		if err != nil {
			return
		}
		return
	}
	return
}

type MessageRoomMemberSuperList []*MessageRoomMemberSuper
type MessageRoomMemberSuperListErr struct {
	MessageRoomMemberSuperList
	Err error
}

func NewMessageRoomMemberList() MessageRoomMemberSuperList {
	return make(MessageRoomMemberSuperList, 0)
}

func (list *MessageRoomMemberSuperList) Find(handler ...gdb.ModelHandler) (err error) {
	err = dao.MessageRoomMember.Ctx(context.TODO()).Handler(handler...).Scan(list)
	return
}

func (list MessageRoomMemberSuperList) Exist(userId uint64) bool {
	for _, item := range list {
		if item.UserId == userId {
			return true
		}
	}
	return false
}

func (list MessageRoomMemberSuperList) Len() int {
	return len(list)
}

func (list MessageRoomMemberSuperList) GetUserIds() (result []uint64) {
	for _, item := range list {
		result = append(result, item.UserId)
	}
	return
}

func (list MessageRoomMemberSuperList) IsEmpty() bool {
	return len(list) == 0
}

func (list MessageRoomMemberSuperList) Search(userId uint64) (result *MessageRoomMemberSuper) {
	for _, item := range list {
		if item.UserId == userId {
			return item
		}
	}
	return
}

func (list MessageRoomMemberSuperList) LoadSysUserSuper() MessageRoomMemberSuperListErr {
	if list.IsEmpty() {
		return MessageRoomMemberSuperListErr{}
	}
	err := g.DB().Model("sys_user").
		Where("id", gdb.ListItemValuesUnique(list, "MessageRoomMember", "UserId")).
		FieldsEx("user_password,user_salt").
		ScanList(&list, "SysUserSuper", "MessageRoomMember", "id:UserId")
	if err != nil {
		g.Log().Error(context.TODO(), err)
	}
	return MessageRoomMemberSuperListErr{
		MessageRoomMemberSuperList: list,
		Err:                        err,
	}
}
