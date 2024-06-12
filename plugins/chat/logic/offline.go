package logic

import (
	"container/ring"
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/tiger1103/gfast/v3/plugins/chat/global"
)

type offlineProcessor struct {
	n        int
	userRing map[UID]*ring.Ring
}

func newOfflineProcessor() *offlineProcessor {
	return &offlineProcessor{
		n:        global.OfflineNum,
		userRing: make(map[UID]*ring.Ring),
	}
}

func (o *offlineProcessor) save(uid UID, msg *Message) {
	if msg.Type != MsgTypeNormal || uid == "" {
		return
	}

	var (
		r  *ring.Ring
		ok bool
	)
	if r, ok = o.userRing[uid]; !ok {
		r = ring.New(o.n)
	}
	r.Value = msg
	o.userRing[uid] = r.Next()
}

func (o *offlineProcessor) Send(user *User) {
	if r, ok := o.userRing[user.UID]; ok {
		r.Do(func(value any) {
			if value != nil {
				err := user.Write(value.(*Message))
				if err != nil {
					g.Log().Info(context.TODO(), err.Error())
				}
			}
		})

		delete(o.userRing, user.UID)
	}
}
