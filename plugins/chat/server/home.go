package server

import (
	"github.com/tiger1103/gfast/v3/plugins/chat/logic"
	"net/http"
)

type Chart struct {
	*logic.Spadger
}

func NewChart() *Chart {
	return &Chart{
		logic.NewSpadger(),
	}
}

// ws连接
func (c *Chart) WebSocketHandleFunc(w http.ResponseWriter, req *http.Request, uid string, keys map[string]interface{}) (err error) {
	err = c.HandleRequestWithKeys(w, req, uid, keys)
	if err != nil {
		return
	}
	return
}

// 在线用户
func (c *Chart) UserListHandleFunc() []logic.User {
	return c.Hub.GetUserList()
}
