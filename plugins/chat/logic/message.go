package logic

import (
	"encoding/json"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/plugins/chat/utils"
	"time"
)

// 消息类型
const (
	MsgTypeNormal     = iota // 用户消息
	MsgTypeUserEnter         // 用户进入
	MsgTypeUserLeave         // 用户退出
	MsgTypeError             // 错误消息
	MsgTypeAddRoom           // 新增群聊
	MsgTypeMemberJoin        // 群成员加入
	MsgTypeMemberQuit        // 群成员退出
	MsgTypeRoomInform        // 群聊通知
)

// 消息格式
const (
	CTypeString = iota // 字符串
	CTypeImg           // 图片
	CTypeJson          // json字符串
)

type Letter struct {
	Ctype   int      `json:"c_type"` // 消息格式   0 - 字符串  1 - 图片
	Time    string   `json:"time"`
	Content string   `json:"content"`
	Ats     []string `json:"ats"`
	RoomId  string   `json:"room_id"` //群聊房间号
}

func NewLetter(b []byte) *Letter {
	var letter Letter
	_ = json.Unmarshal(b, &letter)
	return &letter
}

func (l *Letter) GetTime() (result time.Time) {
	if l.Time == "" {
		return
	}
	var err error
	u := utils.NewUtils()
	result, err = u.Parse(l.Time)
	if err != nil {
		return
	}
	return
}

func (l *Letter) GetContent() []byte {
	return []byte(l.Content)
}

func (l *Letter) GetAts() (result []UID) {
	for _, item := range l.Ats {
		result = append(result, UID(item))
	}
	return
}

type envelope struct {
	t   int
	msg []byte
}

type MyCustomTime time.Time

func (t MyCustomTime) MarshalJSON() ([]byte, error) {
	// 自定义格式，例如 "2023-12-13 12:00:00"
	layout := "2006-01-02 15:04:05"
	return json.Marshal(time.Time(t).Format(layout))
}

type Message struct {
	User    *User        `json:"user"`   // 发信人
	Type    int          `json:"type"`   // 消息类型
	CType   int          `json:"c_type"` // 消息格式
	Content string       `json:"content"`
	MsgTime MyCustomTime `json:"msg_time"`
	Ats     []UID        `json:"ats"`
	Filter  filterFunc   `json:"-"`
	RoomId  string       `json:"room_id"` // 群聊房间号
}

func (m *Message) AtsToUint64() (result []uint64) {
	for _, item := range m.Ats {
		result = append(result, gconv.Uint64(item))
	}
	return
}
func (m *Message) GetContent() []byte {
	return []byte(m.Content)
}

func (m *Message) Json() []byte {
	b, _ := json.Marshal(*m)
	return b
}

type RoomNotifyMessage struct {
	Id    string          `json:"id"`   // 房间ID
	Name  string          `json:"name"` // 房间名称
	Users []*BaseUserInfo `json:"users"`
}

type BaseUserInfo struct {
	Id       string `json:"id"`
	Username string `json:"username"`
	Avatar   string `json:"avatar"`
	NewJoin  bool   `json:"new_join"`
}

func NewSysMessage(content string) *Message {
	return &Message{
		User:    System,
		Type:    MsgTypeNormal,
		Content: content,
		Ats:     nil,
		MsgTime: MyCustomTime(utils.NewUtils().Now()),
	}
}

func NewMessage(user *User, content string) *Message {
	return &Message{
		User:    user,
		Type:    MsgTypeNormal,
		Content: content,
		Ats:     nil,
		MsgTime: MyCustomTime(utils.NewUtils().Now()),
	}
}

func NewMessageByLetter(user *User, letter *Letter) *Message {
	var mt time.Time
	if mt = letter.GetTime(); mt.IsZero() {
		mt = utils.NewUtils().Now()
	}
	message := &Message{
		User:    user,
		Type:    MsgTypeNormal,
		CType:   letter.Ctype,
		Content: letter.Content,
		Ats:     letter.GetAts(),
		MsgTime: MyCustomTime(mt),
		RoomId:  letter.RoomId,
	}
	return message
}

func NewUserEnterMessage(user *User) *Message {
	return &Message{
		User:    user,
		Type:    MsgTypeUserEnter,
		Content: "",
		MsgTime: MyCustomTime(utils.NewUtils().Now()),
	}
}

func NewUserLeaveMessage(user *User) *Message {
	return &Message{
		User:    user,
		Type:    MsgTypeUserLeave,
		Content: "",
		MsgTime: MyCustomTime(utils.NewUtils().Now()),
	}
}

func NewErrorMessage(content string) *Message {
	return &Message{
		User:    System,
		Type:    MsgTypeError,
		Content: content,
		MsgTime: MyCustomTime(utils.NewUtils().Now()),
	}
}

func NewAddRoomMessage(roomId string, ids []UID, payload interface{}) *Message {
	b, _ := json.Marshal(payload)
	return &Message{
		User:    System,
		Type:    MsgTypeAddRoom,
		CType:   CTypeJson,
		Content: string(b),
		MsgTime: MyCustomTime(utils.NewUtils().Now()),
		RoomId:  roomId,
		Ats:     ids,
	}
}

func NewQuitRoomMessage(roomId string, ids []UID, payload interface{}) *Message {
	b, _ := json.Marshal(payload)
	return &Message{
		User:    System,
		Type:    MsgTypeMemberQuit,
		CType:   CTypeJson,
		Content: string(b),
		MsgTime: MyCustomTime(utils.NewUtils().Now()),
		RoomId:  roomId,
		Ats:     ids,
	}
}

func NewJoinRoomMessage(roomId string, ids []UID, payload interface{}) *Message {
	b, _ := json.Marshal(payload)
	return &Message{
		User:    System,
		Type:    MsgTypeMemberJoin,
		CType:   CTypeJson,
		Content: string(b),
		MsgTime: MyCustomTime(utils.NewUtils().Now()),
		RoomId:  roomId,
		Ats:     ids,
	}
}

// 群聊系统消息
func NewRoomInform(roomId string, ids []UID, content string) *Message {
	return &Message{
		User:    System,
		Type:    MsgTypeRoomInform,
		CType:   CTypeString,
		Content: content,
		MsgTime: MyCustomTime(utils.NewUtils().Now()),
		RoomId:  roomId,
		Ats:     ids,
	}
}
