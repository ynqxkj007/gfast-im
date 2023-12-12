package router

import (
	"context"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/tiger1103/gfast/v3/internal/app/chat/controller"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
)

var R = new(Router)

type Router struct{}

func (router *Router) BindController(ctx context.Context, group *ghttp.RouterGroup) {
	group.Group("/chat", func(group *ghttp.RouterGroup) {
		d := &controller.Debug{}
		group.GET("/debug/vars", d.Debug)
		//登录验证拦截
		service.GfToken().Middleware(group)
		//context拦截器
		group.Middleware(service.Middleware().Ctx)
		group.Bind(controller.ChatController)
	})
}
