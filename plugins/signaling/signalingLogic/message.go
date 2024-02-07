package signalingLogic

import "encoding/json"

const SYS_USER_ID = "sysUser"
const TYPE_INFO = "info"
const TYPE_ERROR = "error"
const TYPE_JOIN = "join"
const TYPE_LEAVE = "leave"

/*** 收到的消息  ***/
type ClientMessage struct {
	From string                 `json:"from"`
	To   string                 `json:"to"`
	Msg  map[string]interface{} `json:"msg"`
}

func (client *ClientMessage) IsEmpty() bool {
	return client == nil
}

func (client *ClientMessage) GetMsg() (result []byte) {
	result, _ = json.Marshal(client.Msg)
	return
}

func NewClientMessage(b []byte) (result *ClientMessage) {
	_ = json.Unmarshal(b, &result)
	return
}

/*** 发送的消息  ***/
type Content struct {
	Type string `json:"type"`
	Info string `json:"info"`
}

type Inform struct {
	Form string  `json:"from"`
	Msg  Content `json:"msg"`
}

func NewInform(content string) *Inform {
	return &Inform{
		Form: SYS_USER_ID,
		Msg: Content{
			Type: TYPE_INFO,
			Info: content,
		},
	}
}

func (message *Inform) Byte() (result []byte) {
	result, _ = json.Marshal(*message)
	return
}

// 错误消息
type ErrorInfo struct {
	Inform
}

func NewErrorInfo(content string) *ErrorInfo {
	return &ErrorInfo{
		Inform: Inform{
			Form: SYS_USER_ID,
			Msg: Content{
				Type: TYPE_ERROR,
				Info: content,
			},
		},
	}
}

// 用户进入房间
type JoinMessage struct {
	Inform
}

func NewJoinMessage(form string) *JoinMessage {
	return &JoinMessage{
		Inform: Inform{
			Form: form,
			Msg: Content{
				Type: TYPE_JOIN,
			},
		},
	}
}

// 用户退出房间
type LeaveMessage struct {
	Inform
}

func NewLeaveMessage(form string) *LeaveMessage {
	return &LeaveMessage{
		Inform: Inform{
			Form: form,
			Msg: Content{
				Type: TYPE_LEAVE,
			},
		},
	}
}
