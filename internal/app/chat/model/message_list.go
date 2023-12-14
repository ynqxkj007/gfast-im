package model

import (
	"context"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/tiger1103/gfast/v3/internal/app/chat/dao"
	"github.com/tiger1103/gfast/v3/internal/app/chat/model/do"
	"github.com/tiger1103/gfast/v3/internal/app/chat/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/chat/model/request"
)

type MessageListSuper struct {
	entity.MessageList
	MessageContentSuper *MessageContentSuper `json:"messageContentSuper"`
	FromSysUser         *SysUserSuper        `json:"fromSysUser"` // 建人
}

func NewMessageListSuper() *MessageListSuper {
	return &MessageListSuper{}
}

func (super *MessageListSuper) Get(id uint64) (err error) {
	err = dao.MessageList.Ctx(context.TODO()).Where("id = ?", id).Scan(&super)
	return
}

func (super *MessageListSuper) Collection() MessageListSuperList {
	return MessageListSuperList{super}
}

func (super *MessageListSuper) Add(content string, to ...uint64) (err error) {
	ctx := context.TODO()
	if super == nil {
		return
	}
	if len(to) > 0 {
		err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
			cId, e := dao.MessageContent.Ctx(ctx).TX(tx).Data(g.Map{"content": content}).InsertAndGetId()
			if e != nil {
				return e
			}
			var messageListSuperList MessageListSuperList
			for _, toId := range to {
				messageListSuperList = append(messageListSuperList, &MessageListSuper{
					MessageList: entity.MessageList{
						From:             super.From,
						Mtype:            super.Mtype,
						Ctype:            super.Ctype,
						MsgTime:          super.MsgTime,
						To:               toId,
						MessageContentId: cId,
						RoomId:           super.RoomId,
					},
				})
			}
			_, e = dao.MessageList.Ctx(ctx).TX(tx).Data(messageListSuperList).Insert()
			if e != nil {
				return e
			}
			return nil
		})
	} else if super.RoomId != "" {
		// 记录群聊的历史数据
		err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
			cId, e := dao.MessageContent.Ctx(ctx).TX(tx).Data(g.Map{"content": content}).InsertAndGetId()
			if e != nil {
				return e
			}
			_, e = dao.MessageList.Ctx(ctx).TX(tx).Data(do.MessageList{
				From:             super.From,
				Mtype:            super.Mtype,
				Ctype:            super.Ctype,
				MsgTime:          super.MsgTime,
				To:               super.To,
				MessageContentId: cId,
				RoomId:           super.RoomId,
			}).Insert()
			if e != nil {
				return e
			}
			return nil
		})
	}
	return
}

func (super *MessageListSuper) IsEmpty() bool {
	return super == nil || super.Id == 0
}

type MessageListSuperList []*MessageListSuper
type MessageListSuperListErr struct {
	MessageListSuperList
	Err error
}

func NewMessageListSuperList() MessageListSuperList {
	return MessageListSuperList{}
}

/*
*
获取历史聊天记录
mtype: 消息类型: 0 用户消息 1 用户进入 2 用户退出  3 错误消息
*/
func (list *MessageListSuperList) HistoryMessage(messageListReq request.MessageListReq) (err error) {
	ctx := context.TODO()
	if messageListReq.Limit <= 0 {
		messageListReq.Limit = 10
	}

	if messageListReq.IsRoom == 1 && messageListReq.RoomId != "" {
		// 获取群聊消息
		err = dao.MessageList.Ctx(ctx).
			Where("`room_id` = ? and `to` = ?", messageListReq.RoomId, messageListReq.FormId).
			Where("`mtype` = 0 and `msg_time` < ?", messageListReq.ToDate).
			Order("msg_time desc").
			Limit(messageListReq.Limit).Scan(list)
	} else {
		err = dao.MessageList.Ctx(ctx).
			Where("((`from` = ? and `to` = ?) or (`from` = ? and `to` = ?))", messageListReq.FormId, messageListReq.ToId, messageListReq.ToId, messageListReq.FormId).
			Where("room_id = ''").
			Where("`mtype` = 0 and `msg_time` < ?", messageListReq.ToDate).
			Order("msg_time desc").
			Limit(messageListReq.Limit).Scan(list)
	}
	return
}

func (list MessageListSuperList) IsEmpty() bool {
	return len(list) == 0
}

func (list MessageListSuperList) LoadFromSysUser() MessageListSuperListErr {
	if list.IsEmpty() {
		return MessageListSuperListErr{}
	}
	err := g.DB().Model("sys_user").
		Where("id", gdb.ListItemValuesUnique(list, "MessageList", "From")).
		FieldsEx("user_password,user_salt").
		ScanList(&list, "FromSysUser", "MessageList", "id:From")
	if err != nil {
		g.Log().Error(context.TODO(), err)
	}
	return MessageListSuperListErr{
		MessageListSuperList: list,
		Err:                  err,
	}
}

func (list MessageListSuperList) LoadMessageContentSuper() MessageListSuperListErr {
	if list.IsEmpty() {
		return MessageListSuperListErr{}
	}
	err := g.DB().Model("message_content").
		Where("id", gdb.ListItemValuesUnique(list, "MessageList", "MessageContentId")).
		ScanList(&list, "MessageContentSuper", "MessageList", "id:MessageContentId")
	if err != nil {
		g.Log().Error(context.TODO(), err)
	}

	return MessageListSuperListErr{
		MessageListSuperList: list,
		Err:                  err,
	}
}
