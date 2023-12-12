package router

import (
	"context"
	"github.com/gogf/gf/v2/net/ghttp"
	chatRouter "github.com/tiger1103/gfast/v3/internal/app/chat/router"
)

func (router *Router) BindWorkorderModuleController(ctx context.Context, group *ghttp.RouterGroup) {
	chatRouter.R.BindController(ctx, group)
}
