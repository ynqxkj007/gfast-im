package controller

import (
	"context"
	"errors"
	"expvar"
	"fmt"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/chat"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/chat/dao"
	"github.com/tiger1103/gfast/v3/internal/app/chat/model"
	"github.com/tiger1103/gfast/v3/internal/app/chat/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/common/consts"
	"github.com/tiger1103/gfast/v3/internal/app/common/service"
	systemService "github.com/tiger1103/gfast/v3/internal/app/system/service"
	chartLogic "github.com/tiger1103/gfast/v3/plugins/chat/logic"
	chartServer "github.com/tiger1103/gfast/v3/plugins/chat/server"
	signailing "github.com/tiger1103/gfast/v3/plugins/signaling/signaling"
	"github.com/tiger1103/gfast/v3/plugins/signaling/signalingLogic"
	"math/rand"
	"os"
	"strconv"
	"time"
)

var ChatRoom *chartServer.Chart
var Mrouter *signailing.Melody
var UserCenter *signalingLogic.UserCenter

func init() {
	initializeChatRoom()
	initializeSignaling()
}

func initializeSignaling() {
	ctx := context.TODO()
	Mrouter = signailing.New()
	UserCenter = signalingLogic.NewUserCenter()
	expvar.Publish("broadcaster.rooms", expvar.Func(func() any {
		return UserCenter.Rooms.GetRooms()
	}))

	Mrouter.HandleConnect(func(s *signailing.Session) {
		sh := signalingLogic.NewSessionHelp(s)
		userId := sh.GetUserId()
		roomId := sh.GetRoomId()
		if userId == "" {
			err := sh.Write(signalingLogic.NewErrorInfo(fmt.Sprintf("找不用户信息")).Byte())
			if err != nil {
				g.Log().Error(ctx, "sh.Write err:", err)
			}
			return
		}

		if roomId == "" {
			err := sh.Write(signalingLogic.NewErrorInfo(fmt.Sprintf("房间号必须")).Byte())
			if err != nil {
				g.Log().Error(ctx, "sh.Write err:", err)
			}
			return
		}

		g.Log().Info(ctx, fmt.Sprintf("房间：%s ，用户：%s", roomId, userId))

		if UserCenter.IsExist(userId) {
			g.Log().Info(ctx, fmt.Sprintf("用户:%s已存在", userId))
			err := sh.Write(signalingLogic.NewErrorInfo(fmt.Sprintf("用户:%s已存在", userId)).Byte())
			if err != nil {
				g.Log().Error(ctx, "sh.Write err:", err)
			}
			return
		}

		if UserCenter.Rooms.IsOverLoad(roomId) {
			g.Log().Info(ctx, "房间已超员")
			err := sh.Write(signalingLogic.NewErrorInfo("房间已超员").Byte())
			if err != nil {
				g.Log().Error(ctx, "sh.Write err:", err)
			}
			return
		}

		u := &signalingLogic.UserInfo{
			ID:      userId,
			Session: s,
		}

		// 添加用户
		UserCenter.AddUser(s, u)

		//  加入房间
		UserCenter.Rooms.AddUserAndCreateRoom(roomId, u)

		// 通知房间中的其他客户端有人加入
		UserCenter.Rooms.Broadcast(roomId, signalingLogic.NewJoinMessage(userId).Byte(), func(info *signalingLogic.UserInfo) bool {
			return info.ID != userId
		})

		err := sh.Write(signalingLogic.NewInform(fmt.Sprintf("用户:%s, 加入聊天室:%s", userId, roomId)).Byte())
		if err != nil {
			g.Log().Info(ctx, "sh.Write err:", err)
		}
		g.Log().Info(ctx, fmt.Sprintf("用户:%s, 加入聊天室:%s", userId, roomId))

	})

	Mrouter.HandleDisconnect(func(session *signailing.Session) {
		sh := signalingLogic.NewSessionHelp(session)
		roomId := sh.GetRoomId()
		userId := sh.GetUserId()
		UserCenter.RemoveAll(roomId, session)
		// 通知房间中的其他客户端此连接退出
		UserCenter.Rooms.Broadcast(roomId, signalingLogic.NewLeaveMessage(userId).Byte())
		g.Log().Info(ctx, fmt.Sprintf("用户:%s,退出聊天室%s", userId, roomId))
	})

	Mrouter.HandleError(func(session *signailing.Session, err error) {
		sh := signalingLogic.NewSessionHelp(session)
		g.Log().Info(ctx, fmt.Sprintf("用户:%s，退出， 错误: %s", sh.GetUserId(), err.Error()))
	})

	Mrouter.HandleMessage(func(session *signailing.Session, msg []byte) {
		message := signalingLogic.NewClientMessage(msg)
		users := UserCenter.Filter(func(info *signalingLogic.UserInfo) bool {
			return info.ID == message.To
		})
		if !users.IsEmpty() {
			g.Log().Info(ctx, fmt.Sprintf("message->toid: %s, content: %v", message.To, message.Msg))
			if err := Mrouter.BroadcastMultiple(msg, users.Sessions()); err != nil {
				g.Log().Info(ctx, fmt.Sprintf("Mrouter.BroadcastMultiple err : %s", err.Error()))
			}
		}

	})
}

func initializeChatRoom() {
	ctx := context.TODO()
	ChatRoom = chartServer.NewChart()
	ChatRoom.HandleConnect(func(user *chartLogic.User) {
		if user.UID == "" {
			g.Log().Info(ctx, "ID必须")
			user.Close()
			return
		}

		if ChatRoom.Hub.HasUser(user.UID) {
			m := fmt.Sprintf("ID:%s,用户已在线 ", user.UID)
			g.Log().Info(ctx, m)
			user.Close()
			return
		}
		g.Log().Info(ctx, fmt.Sprintf("ID:%s,%s", user.UID, "the webSocket connection is successful"))
	})

	ChatRoom.HandleError(func(user *chartLogic.User, err error) {
		m := fmt.Sprintf("ID:%s,%s", user.UID, "chat err:"+err.Error())
		g.Log().Info(ctx, m)
	})

	ChatRoom.HandleDisconnect(func(user *chartLogic.User) {
		g.Log().Info(ctx, fmt.Sprintf(" ID:%s,%s", user.UID, "the webSocket connection is closed"))
	})

	ChatRoom.HandleMessage(func(user *chartLogic.User, message chartLogic.Message) {
		if message.Type == 0 {
			// 聊天内容需记录进数据库时，请注释 "if os.Getenv("debug") == "1" {"
			if os.Getenv("debug") == "1" {
				messageListSuper := model.NewMessageListSuper()
				messageListSuper.From = message.User.UIDToUint64()
				messageListSuper.Mtype = message.Type
				messageListSuper.Ctype = message.CType
				messageListSuper.MsgTime = gtime.New(message.MsgTime)
				messageListSuper.RoomId = message.RoomId
				err := messageListSuper.Add(message.Content, message.AtsToUint64()...)
				if err != nil {
					g.Log().Error(context.TODO(), err)
				}
			}

		}
	})

	//// test
	//ticker := time.Tick(5 * time.Second)
	//go func() {
	//	for now := range ticker {
	//		ChatRoom.Hub.Broadcast(logic.NewSysMessage("from server(chat): now time is " + now.String()))
	//	}
	//}()

	expvar.Publish("broadcaster.users", expvar.Func(func() any {
		return ChatRoom.UserListHandleFunc()
	}))
}

// 房间标识前缀
const RootIdentifyPrefix = "roomIdentify_"

type chatController struct{}

var ChatController = new(chatController)

func (c *chatController) SignalingWs(ctx context.Context, req *chat.SignalingWsReq) (res *chat.SignalingWsRes, err error) {

	loginUserRes := systemService.Context().GetLoginUser(ctx).LoginUserRes
	sysUserSuper := model.SysUserSuper{}
	_ = sysUserSuper.Get(loginUserRes.Id)
	payload := make(map[string]interface{})
	if !sysUserSuper.IsEmpty() {
		payload["userId"] = gconv.String(sysUserSuper.Id)
		payload["roomId"] = req.RoomId
	}

	err = Mrouter.HandleRequestWithKeys(g.RequestFromCtx(ctx).Response.Writer, g.RequestFromCtx(ctx).Request, payload)
	if err != nil {
		g.Log().Info(ctx, "/signalingWs request err:", err)
	}
	return
}

// 向目标发起音视频连接
func (c *chatController) InitVideo(ctx context.Context, req *chat.InitVideoReq) (res *chat.InitVideoRes, err error) {
	notifyUserIds := make([]chartLogic.UID, 0, len(req.To))
	for _, item := range req.To {
		notifyUserIds = append(notifyUserIds, chartLogic.UID(item))
	}
	u := ChatRoom.Hub.GetUser(chartLogic.UID(req.From))

	if !u.IsEmpty() {
		ChatRoom.Hub.Broadcast(chartLogic.NewInitVideoConn(&u, notifyUserIds, map[string]interface{}{"roomId": req.RoomId}))
	}

	return
}

func (c *chatController) WebSocketHandle(ctx context.Context, req *chat.ChatWsReq) (res *chat.ChatWsRes, err error) {
	loginUserRes := systemService.Context().GetLoginUser(ctx).LoginUserRes
	sysUserSuper := model.SysUserSuper{}
	_ = sysUserSuper.Get(loginUserRes.Id)
	if sysUserSuper.IsEmpty() {
		err = errors.New("找不到登录用户")
		return
	}
	var userId string
	payload := make(map[string]interface{})
	userId = gconv.String(sysUserSuper.Id)
	payload["uid"] = userId
	payload["nickname"] = sysUserSuper.UserNickname
	payload["avatar"] = sysUserSuper.Avatar
	err = ChatRoom.WebSocketHandleFunc(g.RequestFromCtx(ctx).Response.Writer, g.RequestFromCtx(ctx).Request, userId, payload)
	if err != nil {
		g.Log().Error(ctx, err)
		return
	}
	return
}

// 获取在线用户
func (c *chatController) OnlineUserList(ctx context.Context, req *chat.OnlineUserListReq) (res *chat.OnlineUserListRes, err error) {
	res = new(chat.OnlineUserListRes)
	res.UserList = ChatRoom.UserListHandleFunc()
	return
}

// 上传图片
func (c *chatController) SingleImg(ctx context.Context, req *system.UploadSingleImgReq) (res *system.UploadSingleRes, err error) {
	file := req.File
	v, _ := g.Cfg().Get(ctx, "upload.default")
	response, err := service.Upload().UploadFile(ctx, file, consts.CheckFileTypeImg, v.Int())
	if err != nil {
		return
	}
	res = &system.UploadSingleRes{
		UploadResponse: response,
	}
	// 上传第三方
	return
}

// 获取聊天记录
func (c *chatController) HistoryChat(ctx context.Context, req *chat.HistoryChatReq) (res *chat.HistoryChatRes, err error) {
	messageListSuperList := model.NewMessageListSuperList()
	err = messageListSuperList.HistoryMessage(req.MessageListReq)
	if err != nil {
		return
	}
	messageListSuperList.LoadMessageContentSuper().LoadFromSysUser()
	res = &chat.HistoryChatRes{
		MessageListSuperList: messageListSuperList,
	}
	return
}

// 获取用户列表
func (c *chatController) GetUserList(ctx context.Context, req *chat.UserListReq) (res *chat.UserListRes, err error) {
	sysUserSuperList := model.NewSysUserSuperList()
	err = sysUserSuperList.Find(func(m *gdb.Model) *gdb.Model {
		if req.NotSelf == 1 {
			loginUserRes := systemService.Context().GetLoginUser(ctx).LoginUserRes
			m = m.Where("id <> ?", loginUserRes.Id)
		}
		return m
	})
	if err != nil {
		return
	}
	res = &chat.UserListRes{
		UserList: sysUserSuperList,
	}
	return
}

// 获取房间列表
func (c *chatController) GetRoomList(ctx context.Context, req *chat.GetRoomListReq) (res *chat.GetRoomListRes, err error) {
	loginUserRes := systemService.Context().GetLoginUser(ctx).LoginUserRes
	messageRoomList := model.NewMessageRoomSuperList()
	err = messageRoomList.Find(func(m *gdb.Model) *gdb.Model {
		m = m.Order("created_at desc").Where("id in (?)", g.DB().Model("message_room_member").Where("user_id = ?", loginUserRes.Id).Fields("room_id"))
		return m
	})
	messageRoomList.LoadMessageRoomMemberSuperList().AllMessageRoomMemberSuperList().LoadSysUserSuper()
	res = &chat.GetRoomListRes{
		MessageRoomSuperList: messageRoomList,
	}
	return
}

// 创建房间
func (c *chatController) CreateRoom(ctx context.Context, req *chat.CreateRoomReq) (res *chat.CreateRoomRes, err error) {
	res = &chat.CreateRoomRes{}
	loginUserRes := systemService.Context().GetLoginUser(ctx).LoginUserRes
	err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) (err error) {
		r := rand.New(rand.NewSource(time.Now().UnixNano()))
		roomName := fmt.Sprintf("%s_%d", req.Name, r.Intn(999))
		var lastId int64
		lastId, err = dao.MessageRoom.Ctx(ctx).TX(tx).Data(g.Map{
			"name": roomName,
		}).InsertAndGetId()
		if err != nil {
			return
		}
		identify := fmt.Sprintf("%s%d", RootIdentifyPrefix, lastId)
		_, err = dao.MessageRoom.Ctx(ctx).TX(tx).Where("id =?", lastId).Data(g.Map{
			"identify": identify,
		}).Update()
		if err != nil {
			return
		}

		// 添加群成员,包含创建人
		sysUserSuperList := model.NewSysUserSuperList()
		err = sysUserSuperList.Find(func(m *gdb.Model) *gdb.Model {
			return m.Where("id in (?)", append([]uint64{loginUserRes.Id}, req.UserIds...)).FieldsEx("user_password,user_salt,remark")
		})
		if err != nil {
			return
		}
		if sysUserSuperList.Len()-1 != len(req.UserIds) {
			err = errors.New("非法的用户ID")
		}

		lastIdTemp := gconv.Uint64(lastId)
		var messageRoomMemberSuperList model.MessageRoomMemberSuperList
		for _, v := range sysUserSuperList {
			messageRoomMemberSuperList = append(messageRoomMemberSuperList, &model.MessageRoomMemberSuper{
				MessageRoomMember: entity.MessageRoomMember{
					RoomId: lastIdTemp,
					UserId: v.Id,
				},
			})
		}

		_, err = dao.MessageRoomMember.Ctx(ctx).TX(tx).Data(messageRoomMemberSuperList).Insert()
		if err != nil {
			return
		}

		res.Identify = identify
		res.RoomName = roomName
		res.UserList = sysUserSuperList

		// 通知其他群成员
		notifyUserIds := make([]chartLogic.UID, 0, len(req.UserIds))
		for _, item := range req.UserIds {
			notifyUserIds = append(notifyUserIds, chartLogic.UID(strconv.FormatUint(item, 10)))
		}

		var notifyMessage chartLogic.RoomNotifyMessage

		notifyMessage.Id = identify
		notifyMessage.Name = roomName

		for _, item := range sysUserSuperList {
			notifyMessage.Users = append(notifyMessage.Users, &chartLogic.BaseUserInfo{
				Id:       strconv.FormatUint(item.Id, 10),
				Avatar:   item.Avatar,
				Username: item.UserNickname,
			})
		}
		ChatRoom.Hub.Broadcast(chartLogic.NewAddRoomMessage(identify, notifyUserIds, notifyMessage))
		return nil
	})
	return
}

// 修改房间名称
func (c *chatController) UpdateRoomName(ctx context.Context, req *chat.UpdateRoomNameReq) (res *chat.UpdateRoomNameRes, err error) {
	messageRoomSuper := model.NewMessageRoomSuper()
	err = messageRoomSuper.FindByIdentify(req.Id)
	if err != nil {
		return
	}
	if messageRoomSuper.IsEmpty() {
		err = errors.New("找不到群聊")
		return
	}
	messageRoomSuper.Name = req.Name
	err = messageRoomSuper.Update("name")
	if err != nil {
		return
	}
	return
}

// 更新群公告
func (c *chatController) UpdateRoomNotice(ctx context.Context, req *chat.UpdateRoomNoticeReq) (res *chat.UpdateRoomNoticeRes, err error) {
	messageRoomSuper := model.NewMessageRoomSuper()
	err = messageRoomSuper.FindByIdentify(req.Id)
	if err != nil {
		return
	}
	if messageRoomSuper.IsEmpty() {
		err = errors.New("找不到群聊")
	}

	messageRoomSuper.Inform = req.Inform
	err = messageRoomSuper.Update("inform")
	if err != nil {
		return
	}

	// 通知群成员
	if req.Inform != "" {
		messageRoomSuper.Collection().LoadMessageRoomMemberSuperList()
		notifyUserIds := make([]chartLogic.UID, 0)
		for _, item := range messageRoomSuper.MessageRoomMemberSuperList {
			notifyUserIds = append(notifyUserIds, chartLogic.UID(strconv.FormatUint(item.UserId, 10)))
		}

		if len(notifyUserIds) > 0 {
			ChatRoom.Hub.Broadcast(chartLogic.NewRoomInform(messageRoomSuper.Identify, notifyUserIds, "群公告："+req.Inform))
		}
	}

	return
}

// 退出群聊
func (c *chatController) Quit(ctx context.Context, req *chat.QuitRoomReq) (res *chat.QuitRoomRes, err error) {
	messageRoomSuper := model.NewMessageRoomSuper()
	err = messageRoomSuper.FindByIdentify(req.Identify)
	if err != nil {
		return
	}
	if messageRoomSuper.IsEmpty() {
		err = errors.New("找不到群聊")
		return
	}
	messageRoomSuper.Collection().LoadMessageRoomMemberSuperList()

	var member *model.MessageRoomMemberSuper
	if member = messageRoomSuper.MessageRoomMemberSuperList.Search(req.QuitUserId); member == nil {
		err = errors.New("用户不存在")
		return
	}

	i, _ := member.Delete()
	if messageRoomSuper.MessageRoomMemberSuperList.Len() == 1 && i > 0 {
		messageRoomSuper.Delete()
	}
	// 通知群成员
	notifyUserIds := make([]chartLogic.UID, 0)
	for _, item := range messageRoomSuper.MessageRoomMemberSuperList {
		if item.UserId == req.QuitUserId {
			continue
		}
		notifyUserIds = append(notifyUserIds, chartLogic.UID(strconv.FormatUint(item.UserId, 10)))
	}
	if len(notifyUserIds) > 0 {
		member.Collection().LoadSysUserSuper()
		if !member.SysUserSuper.IsEmpty() {
			var notifyMessage chartLogic.RoomNotifyMessage
			notifyMessage.Id = messageRoomSuper.Identify
			notifyMessage.Name = messageRoomSuper.Name
			notifyMessage.Users = append(notifyMessage.Users, &chartLogic.BaseUserInfo{
				Id:       strconv.FormatUint(member.UserId, 10),
				Avatar:   member.SysUserSuper.Avatar,
				Username: member.SysUserSuper.UserNickname,
			})
			ChatRoom.Hub.Broadcast(chartLogic.NewQuitRoomMessage(req.Identify, notifyUserIds, notifyMessage))
		}
	}
	return
}

// 添加群成员
func (c *chatController) AddGroupMember(ctx context.Context, req *chat.AddGroupMemberReq) (res *chat.AddGroupMemberRes, err error) {
	messageRoomSuper := model.NewMessageRoomSuper()
	err = messageRoomSuper.FindByIdentify(req.Identify)
	if err != nil {
		return
	}
	if messageRoomSuper.IsEmpty() {
		err = errors.New("找不到群聊")
		return
	}
	sysUserSuperList := model.NewSysUserSuperList()
	err = sysUserSuperList.Find(func(m *gdb.Model) *gdb.Model {
		return m.Where("id in (?)", req.UserIds).FieldsEx("user_password,user_salt,remark")
	})
	if err != nil {
		return
	}
	if sysUserSuperList.Len() != len(req.UserIds) {
		err = errors.New("非法的用户ID")
		return
	}

	emptyMessageRoomMemberList := model.NewMessageRoomMemberList()
	err = emptyMessageRoomMemberList.Find(func(m *gdb.Model) *gdb.Model {
		return m.Where("room_id =? and user_id in (?)", messageRoomSuper.Id, req.UserIds)
	})
	if err != nil {
		return
	}

	if !emptyMessageRoomMemberList.IsEmpty() {
		err = errors.New("用户已加入请勿重复添加")
		return
	}

	var messageRoomMemberSuperList model.MessageRoomMemberSuperList
	for _, v := range req.UserIds {
		messageRoomMemberSuperList = append(messageRoomMemberSuperList, &model.MessageRoomMemberSuper{
			MessageRoomMember: entity.MessageRoomMember{
				RoomId: messageRoomSuper.Id,
				UserId: gconv.Uint64(v),
			},
		})
	}

	_, err = dao.MessageRoomMember.Ctx(ctx).Data(messageRoomMemberSuperList).Replace()
	if err != nil {
		return
	}
	res = &chat.AddGroupMemberRes{}
	res.UserList = sysUserSuperList

	// 通知群成员
	messageRoomSuper.Collection().LoadMessageRoomMemberSuperList()
	allMessageRoomMemberSuperList := messageRoomSuper.MessageRoomMemberSuperList
	notifyUserIds := make([]chartLogic.UID, 0)
	for _, item := range allMessageRoomMemberSuperList {
		notifyUserIds = append(notifyUserIds, chartLogic.UID(strconv.FormatUint(item.UserId, 10)))
	}
	if len(notifyUserIds) > 0 {
		allMessageRoomMemberSuperList.LoadSysUserSuper()

		var notifyMessage chartLogic.RoomNotifyMessage
		notifyMessage.Id = messageRoomSuper.Identify
		notifyMessage.Name = messageRoomSuper.Name

		for _, item := range allMessageRoomMemberSuperList {
			notifyMessage.Users = append(notifyMessage.Users, &chartLogic.BaseUserInfo{
				Id:       strconv.FormatUint(item.UserId, 10),
				Avatar:   item.SysUserSuper.Avatar,
				Username: item.SysUserSuper.UserNickname,
				NewJoin:  messageRoomMemberSuperList.Exist(item.UserId),
			})
		}
		ChatRoom.Hub.Broadcast(chartLogic.NewJoinRoomMessage(req.Identify, notifyUserIds, notifyMessage))

	}

	return
}
