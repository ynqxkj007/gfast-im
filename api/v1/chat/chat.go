package chat

import (
	"github.com/gogf/gf/v2/frame/g"
	commonApi "github.com/tiger1103/gfast/v3/api/v1/common"
	"github.com/tiger1103/gfast/v3/internal/app/chat/model"
	"github.com/tiger1103/gfast/v3/internal/app/chat/model/request"
	"github.com/tiger1103/gfast/v3/plugins/chat/logic"
)

type ChatWsReq struct {
	g.Meta `path:"/ws" tags:"chat" method:"get" summary:"ws连接"`
	commonApi.Author
}

type ChatWsRes struct {
	commonApi.EmptyRes
}

type OnlineUserListReq struct {
	g.Meta `path:"/onlineUserList" tags:"chat" method:"get" summary:"在线用户"`
	commonApi.Author
}

type OnlineUserListRes struct {
	commonApi.EmptyRes
	UserList []logic.User `json:"userList"`
}

type HistoryChatReq struct {
	g.Meta `path:"/historyChat" tags:"chat" method:"get" summary:"历史聊天记录"`
	commonApi.Author
	request.MessageListReq
}

type HistoryChatRes struct {
	commonApi.EmptyRes
	MessageListSuperList model.MessageListSuperList `json:"messageListSuperList"`
}

type UserListReq struct {
	g.Meta  `path:"/userList" tags:"chat" method:"get" summary:"用户列表"`
	NotSelf int `p:"notSelf"`
	commonApi.Author
}

type UserListRes struct {
	commonApi.EmptyRes
	UserList model.SysUserSuperList `json:"userList"`
}

// 添加群聊成员
type AddGroupMemberReq struct {
	g.Meta `path:"/addGroupMember" tags:"chat" method:"post" summary:"添加群聊成员"`
	commonApi.Author
	Identify string   `json:"identify"  v:"required#房间ID必须"`
	UserIds  []string `json:"userIds" v:"required#房间成员必须"`
}

type AddGroupMemberRes struct {
	commonApi.EmptyRes
	UserList model.SysUserSuperList `json:"userList"`
}

// 退出房间
type QuitRoomReq struct {
	g.Meta `path:"/quitRoom" tags:"chat" method:"post" summary:"退出房间"`
	commonApi.Author
	Identify   string `json:"identify"`
	QuitUserId uint64 `json:"quitUserId"`
}

type QuitRoomRes struct {
	commonApi.EmptyRes
}

// 创建房间
type CreateRoomReq struct {
	g.Meta `path:"/createRoom" tags:"chat" method:"post" summary:"创建房间"`
	commonApi.Author
	Name    string   `p:"name" v:"required#房间名称必须"`  // 房间名称
	UserIds []uint64 `p:"userIds" v:"required#成员必须"` //用户id列表
}

type CreateRoomRes struct {
	commonApi.EmptyRes
	Identify string                 `json:"identify"`
	RoomName string                 `json:"roomName"`
	UserList model.SysUserSuperList `json:"userList"`
}

// 修改房间名称
type UpdateRoomNameReq struct {
	g.Meta `path:"/updateRoomName" tags:"chat" method:"post" summary:"创建房间"`
	commonApi.Author
	Id   string `p:"id" v:"required#房间ID必须"`
	Name string `p:"name" v:"required#房间名称必须"`
}

type UpdateRoomNameRes struct {
	commonApi.EmptyRes
}

// 修改房间公告
type UpdateRoomNoticeReq struct {
	g.Meta `path:"/updateRoomNotice" tags:"chat" method:"post" summary:"修改房间公告"`
	commonApi.Author
	Id     string `p:"id" v:"required#房间ID必须"`
	Inform string `p:"inform" v:"required#房间公告必须"`
}

type UpdateRoomNoticeRes struct {
	commonApi.EmptyRes
}

// 获取房间列表
type GetRoomListReq struct {
	g.Meta `path:"/getRoomList" tags:"chat" method:"get" summary:"获取房间列表"`
	commonApi.Author
	//UserId uint64 `p:"userId"`
}

type GetRoomListRes struct {
	commonApi.EmptyRes
	MessageRoomSuperList model.MessageRoomSuperList `json:"list"`
}

type DebugReq struct {
	g.Meta `path:"/debug/vars" tags:"chat" method:"get" summary:"debug"`
	commonApi.Author
}

type DebugRes struct {
	Data interface{} `json:"data"`
}
