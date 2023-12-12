package system

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
)

// 单图上传
type UploadSingleImgReq struct {
	g.Meta `path:"/upload/singleImg" tags:"后台文件上传" method:"post" summary:"上传图片"`
	File   *ghttp.UploadFile `p:"file" type:"file" dc:"选择上传文件" v:"required#上传文件必须"`
}

// 单文件上传
type UploadSingleFileReq struct {
	g.Meta `path:"/upload/singleFile" tags:"后台文件上传" method:"post" summary:"上传文件"`
	File   *ghttp.UploadFile `p:"file" type:"file" dc:"选择上传文件"  v:"required#上传文件必须"`
}

type UploadSingleRes struct {
	g.Meta `mime:"application/json"`
	UploadResponse
}

// 多图上传
type UploadMultipleImgReq struct {
	g.Meta `path:"/upload/multipleImg" tags:"后台文件上传" method:"post" summary:"上传多图片"`
	File   ghttp.UploadFiles `p:"file" type:"file" dc:"选择上传文件"  v:"required#上传文件必须"`
}

// 多文件上传
type UploadMultipleFileReq struct {
	g.Meta `path:"/upload/multipleFile" tags:"后台文件上传" method:"post" summary:"上传多文件"`
	File   ghttp.UploadFiles `p:"file" type:"file" dc:"选择上传文件"  v:"required#上传文件必须"`
}

type UploadMultipleRes []*UploadResponse

type UploadResponse struct {
	Size     int64  `json:"size"   dc:"文件大小"`
	Path     string `json:"path" dc:"文件相对路径"`
	FullPath string `json:"fullPath" dc:"文件绝对路径"`
	Name     string `json:"name" dc:"文件名称"`
	Type     string `json:"type" dc:"文件类型"`
}
