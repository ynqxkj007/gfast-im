/*
* @desc:上传处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/9/28 9:37
 */

package upload

import (
	"context"
	"errors"
	"fmt"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/text/gregex"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/common/consts"
	"github.com/tiger1103/gfast/v3/internal/app/common/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/common/service"
	"github.com/tiger1103/gfast/v3/library/upload"
)

func init() {
	service.RegisterUpload(New())
}

func New() *sUpload {
	return &sUpload{}
}

type sUpload struct{}

// UploadFiles 上传多文件
func (s *sUpload) UploadFiles(ctx context.Context, files []*ghttp.UploadFile, checkFileType string, source int) (result system.UploadMultipleRes, err error) {
	for _, item := range files {
		f, e := s.UploadFile(ctx, item, checkFileType, source)
		if e != nil {
			return
		}
		result = append(result, &f)
	}
	return
}

// UploadFile 上传单文件
func (s *sUpload) UploadFile(ctx context.Context, file *ghttp.UploadFile, checkFileType string, source int) (result system.UploadResponse, err error) {

	// 检查文件类型
	err = s.CheckType(ctx, checkFileType, file)
	if err != nil {
		return
	}

	// 检查文件大小
	err = s.CheckSize(ctx, checkFileType, file)
	if err != nil {
		return
	}

	uploader := upload.GetUploader(upload.UploaderType(source))
	if uploader == nil {
		err = errors.New("没有找到上传适配器")
		return
	}
	return uploader.Upload(ctx, file)
}

// CheckSize 检查上传文件大小
func (s *sUpload) CheckSize(ctx context.Context, checkFileType string, file *ghttp.UploadFile) (err error) {

	var (
		configSize *entity.SysConfig
	)

	if checkFileType == consts.CheckFileTypeFile {

		//获取上传大小配置
		configSize, err = s.getUpConfig(ctx, consts.FileSizeKey)
		if err != nil {
			return
		}
	} else if checkFileType == consts.CheckFileTypeImg {

		//获取上传大小配置
		configSize, err = s.getUpConfig(ctx, consts.ImgSizeKey)
		if err != nil {
			return
		}
	} else {
		return errors.New(fmt.Sprintf("文件检查类型错误:%s|%s", consts.CheckFileTypeFile, consts.CheckFileTypeImg))
	}

	var rightSize bool
	rightSize, err = s.checkSize(configSize.ConfigValue, file.Size)
	if err != nil {
		return
	}
	if !rightSize {
		err = gerror.New("上传文件超过最大尺寸：" + configSize.ConfigValue)
		return
	}
	return
}

// CheckType 检查上传文件类型
func (s *sUpload) CheckType(ctx context.Context, checkFileType string, file *ghttp.UploadFile) (err error) {

	var (
		configType *entity.SysConfig
	)

	if checkFileType == consts.CheckFileTypeFile {
		//获取上传类型配置
		configType, err = s.getUpConfig(ctx, consts.FileTypeKey)
		if err != nil {
			return
		}

	} else if checkFileType == consts.CheckFileTypeImg {
		//获取上传类型配置
		configType, err = s.getUpConfig(ctx, consts.ImgTypeKey)
		if err != nil {
			return
		}
	} else {
		return errors.New(fmt.Sprintf("文件检查类型错误:%s|%s", consts.CheckFileTypeFile, consts.CheckFileTypeImg))
	}

	rightType := s.checkFileType(file.Filename, configType.ConfigValue)
	if !rightType {
		err = gerror.New("上传文件类型错误，只能包含后缀为：" + configType.ConfigValue + "的文件。")
		return
	}
	return
}

// 获取上传配置
func (s *sUpload) getUpConfig(ctx context.Context, key string) (config *entity.SysConfig, err error) {
	config, err = service.SysConfig().GetConfigByKey(ctx, key)
	if err != nil {
		return
	}
	if config == nil {
		err = gerror.New("上传文件类型未设置，请在后台配置")
		return
	}
	return
}

// 判断上传文件类型是否合法
func (s *sUpload) checkFileType(fileName, typeString string) bool {
	suffix := gstr.SubStrRune(fileName, gstr.PosRRune(fileName, ".")+1, gstr.LenRune(fileName)-1)
	imageType := gstr.Split(typeString, ",")
	rightType := false
	for _, v := range imageType {
		if gstr.Equal(suffix, v) {
			rightType = true
			break
		}
	}
	return rightType
}

// 检查文件大小是否合法
func (s *sUpload) checkSize(configSize string, fileSize int64) (bool, error) {
	match, err := gregex.MatchString(`^([0-9]+)(?i:([a-z]*))$`, configSize)
	if err != nil {
		return false, err
	}
	if len(match) == 0 {
		err = gerror.New("上传文件大小未设置，请在后台配置，格式为（30M,30k,30MB）")
		return false, err
	}
	var cfSize int64
	switch gstr.ToUpper(match[2]) {
	case "MB", "M":
		cfSize = gconv.Int64(match[1]) * 1024 * 1024
	case "KB", "K":
		cfSize = gconv.Int64(match[1]) * 1024
	case "":
		cfSize = gconv.Int64(match[1])
	}
	if cfSize == 0 {
		err = gerror.New("上传文件大小未设置，请在后台配置，格式为（30M,30k,30MB），最大单位为MB")
		return false, err
	}
	return cfSize >= fileSize, nil
}

// 静态文件夹目录
func (s *sUpload) getStaticPath(ctx context.Context) string {
	value, _ := g.Cfg().Get(ctx, "server.serverRoot")
	if !value.IsEmpty() {
		return value.String()
	}
	return ""
}
