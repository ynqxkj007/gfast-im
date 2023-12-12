package controller

import (
	"context"
	"expvar"
	"fmt"
	"github.com/tiger1103/gfast/v3/api/v1/chat"
)

type Debug struct {
}

func (d *Debug) Debug(ctx context.Context, req *chat.DebugReq) (res *chat.DebugRes, err error) {

	var arr []string
	expvar.Do(func(value expvar.KeyValue) {
		arr = append(arr, fmt.Sprintf("%s:%v\n", value.Key, value.Value))
	})
	res = &chat.DebugRes{
		Data: arr,
	}
	return
}
