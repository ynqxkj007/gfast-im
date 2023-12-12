package request

import "github.com/gogf/gf/v2/os/gtime"

type MessageListReq struct {
	FormId uint64      `p:"formId"`
	ToId   uint64      `p:"toId"`
	ToDate *gtime.Time `p:"toDate"`
	Limit  int         `p:"limit"`
	RoomId string      `p:"roomId"`  //群聊房间号
	IsRoom int         `p:"is_room"` // 是否群聊
}
