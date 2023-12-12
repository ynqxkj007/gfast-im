/*
* @desc:oss上传
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2023/8/23 11:11
 */

package upload

import (
	"context"
	"github.com/aliyun/aliyun-oss-go-sdk/oss"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gfile"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/util/grand"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/library/liberr"
	"mime/multipart"
	"strconv"
	"strings"
)

type OSS struct {
	AccessKeyID     string `json:"accessKeyId"`
	AccessKeySecret string `json:"accessKeySecret"`
	EndPoint        string `json:"endPoint"`
	BucketName      string `json:"bucketName"`
	IsHttps         bool   `json:"isHttps"`
	Path            string `json:"path"`
}

func (s *OSS) Upload(ctx context.Context, file *ghttp.UploadFile) (result system.UploadResponse, err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		var (
			client *oss.Client
			bucket *oss.Bucket
			fp     multipart.File
		)
		err = g.Cfg().MustGet(ctx, "upload.oss").Scan(&s)
		liberr.ErrIsNil(ctx, err)
		client, err = s.getClient()
		liberr.ErrIsNil(ctx, err)
		// 获取存储空间。
		bucket, err = client.Bucket(s.BucketName)
		liberr.ErrIsNil(ctx, err)
		name := gfile.Basename(file.Filename)
		name = strings.ToLower(strconv.FormatInt(gtime.TimestampNano(), 36) + grand.S(6))
		name = s.Path + "/" + name + gfile.Ext(file.Filename)
		fp, err = file.Open()
		liberr.ErrIsNil(ctx, err)
		err = bucket.PutObject(name, fp)
		liberr.ErrIsNil(ctx, err)
		schema := "http"
		if s.IsHttps {
			schema = "https"
		}
		url := schema + "://" + s.EndPoint + "/" + name
		result = system.UploadResponse{
			Size:     file.Size,
			Path:     url,
			FullPath: url,
			Name:     file.Filename,
			Type:     file.Header.Get("Content-type"),
		}
	})
	return
}

func (s *OSS) getClient() (client *oss.Client, err error) {
	// 设置连接数为10，每个主机的最大闲置连接数为20，每个主机的最大连接数为20。
	conn := oss.MaxConns(10, 20, 20)
	// 设置HTTP连接超时时间为20秒，HTTP读取或写入超时时间为60秒。
	time := oss.Timeout(20, 60)
	// 设置是否支持将自定义域名作为Endpoint，默认不支持。
	cname := oss.UseCname(true)
	// 设置HTTP的User-Agent头，默认为aliyun-sdk-go。
	userAgent := oss.UserAgent("aliyun-sdk-go")
	// 设置是否开启HTTP重定向，默认开启。
	redirect := oss.RedirectEnabled(true)
	// 设置是否开启SSL证书校验，默认关闭。
	verifySsl := oss.InsecureSkipVerify(false)
	// 开启CRC加密。
	crc := oss.EnableCRC(true)
	// 设置日志模式。
	logLevel := oss.SetLogLevel(oss.LogOff)
	client, err = oss.New(s.EndPoint,
		s.AccessKeyID,
		s.AccessKeySecret,
		conn, time, cname, userAgent, verifySsl, redirect, crc, logLevel)
	return
}
