package logic

import (
	"encoding/json"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/plugins/chat/utils"
	"time"
)

// 消息类型
const (
	MsgTypeNormal    = iota // 用户消息
	MsgTypeUserEnter        // 用户进入
	MsgTypeUserLeave        // 用户退出
	MsgTypeError            // 错误消息
	MsgTypeAddRoom          // 新增群聊
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

type Message struct {
	User    *User      `json:"user"`   // 发信人
	Type    int        `json:"type"`   // 消息类型
	CType   int        `json:"c_type"` // 消息格式
	Content string     `json:"content"`
	MsgTime time.Time  `json:"msg_time"`
	Ats     []UID      `json:"ats"`
	Filter  filterFunc `json:"-"`
	RoomId  string     `json:"room_id"` // 群聊房间号
}

func (m *Message) AtsToUint64() (result []uint64) {
	for _, item := range m.Ats {
		result = append(result, gconv.Uint64(item))
	}
	return
}

func NewSysMessage(content string) *Message {
	return &Message{
		User:    System,
		Type:    MsgTypeNormal,
		Content: content,
		Ats:     nil,
		MsgTime: utils.NewUtils().Now(),
	}
}

func NewMessage(user *User, content string) *Message {
	return &Message{
		User:    user,
		Type:    MsgTypeNormal,
		Content: content,
		Ats:     nil,
		MsgTime: utils.NewUtils().Now(),
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
		MsgTime: mt,
		RoomId:  letter.RoomId,
	}
	return message
}

func NewUserEnterMessage(user *User) *Message {
	return &Message{
		User:    user,
		Type:    MsgTypeUserEnter,
		Content: "",
		MsgTime: utils.NewUtils().Now(),
	}
}

func NewUserLeaveMessage(user *User) *Message {
	return &Message{
		User:    user,
		Type:    MsgTypeUserLeave,
		Content: "",
		MsgTime: utils.NewUtils().Now(),
	}
}

func NewErrorMessage(content string) *Message {
	return &Message{
		User:    System,
		Type:    MsgTypeError,
		Content: content,
		MsgTime: utils.NewUtils().Now(),
	}
}

func NewAddRoomMessage(roomId string, ids []UID, payload interface{}) *Message {
	b, _ := json.Marshal(payload)
	return &Message{
		User:    System,
		Type:    MsgTypeAddRoom,
		CType:   CTypeJson,
		Content: string(b),
		MsgTime: utils.NewUtils().Now(),
		RoomId:  roomId,
		Ats:     ids,
	}
}

func (m *Message) GetContent() []byte {
	return []byte(m.Content)
}

func (m *Message) Json() []byte {
	b, _ := json.Marshal(*m)
	return b
}
