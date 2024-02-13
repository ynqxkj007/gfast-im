package cmd

import (
	"context"
	"github.com/gogf/gf/v2/encoding/gbase64"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/net/goai"
	"github.com/gogf/gf/v2/os/gcmd"
	"github.com/gogf/gf/v2/os/glog"
	"github.com/tiger1103/gfast/v3/internal/consts"
	"github.com/tiger1103/gfast/v3/internal/router"
	"github.com/tiger1103/gfast/v3/library/upload"
)

var (
	Main = gcmd.Command{
		Name:  "main",
		Usage: "main",
		Brief: "start http server",
		Func: func(ctx context.Context, parser *gcmd.Parser) (err error) {
			g.Log().SetFlags(glog.F_ASYNC | glog.F_TIME_DATE | glog.F_TIME_TIME | glog.F_FILE_LONG)
			g.Log().Info(ctx, gbase64.MustDecodeString(consts.Logo), "Version:", consts.Version)
			s := g.Server()
			// 开启https
			// s.EnableHTTPS("./keys/private.crt", "./keys/private.key")
			//上传的文件允许跨域请求
			s.BindHookHandler("/upload_file/*", ghttp.HookBeforeServe, func(r *ghttp.Request) {
				r.Response.CORSDefault()
			})

			s.Group("/", func(group *ghttp.RouterGroup) {
				router.R.BindController(ctx, group)
			})
			enhanceOpenAPIDoc(s)
			//注册相关组件
			register()
			s.Run()
			return nil
		},
	}
)

// 相关组件注册
func register() {
	//注册上传组件
	upload.Register()
}

func enhanceOpenAPIDoc(s *ghttp.Server) {
	openapi := s.GetOpenApi()
	openapi.Config.CommonResponse = ghttp.DefaultHandlerResponse{}
	openapi.Config.CommonResponseDataField = `Data`

	// API description.
	openapi.Info = goai.Info{
		Title:       consts.OpenAPITitle,
		Description: consts.OpenAPIDescription,
		Contact: &goai.Contact{
			Name: consts.OpenAPIContactName,
			URL:  consts.OpenAPIContactUrl,
		},
	}
}
