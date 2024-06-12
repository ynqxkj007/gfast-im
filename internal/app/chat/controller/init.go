package controller

import (
	"context"
	"expvar"
	"fmt"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/tiger1103/gfast/v3/internal/app/chat/model"
	chartLogic "github.com/tiger1103/gfast/v3/plugins/chat/logic"
	chartServer "github.com/tiger1103/gfast/v3/plugins/chat/server"
	signailing "github.com/tiger1103/gfast/v3/plugins/signaling/signaling"
	"github.com/tiger1103/gfast/v3/plugins/signaling/signalingLogic"
	"os"
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
		//if user.UID == "" {
		//	g.Log().Info(ctx, "ID必须")
		//	user.Close()
		//	return
		//}
		//
		//if ChatRoom.Hub.HasUser(user.UID) {
		//	m := fmt.Sprintf("ID:%s,用户已在线 ", user.UID)
		//	g.Log().Info(ctx, m)
		//	user.Close()
		//	return
		//}
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
