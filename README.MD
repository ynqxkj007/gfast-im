# GFast-V3
<div align="center">
	<img src="https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2022-04-19/gfastlogo.png">
    <p>
        <h1>GFast V3.2</h1>
    </p>
    <p align="center">
        <a href="https://goframe.org/pages/viewpage.action?pageId=1114119" target="_blank">
	        <img src="https://img.shields.io/badge/goframe-2.0-green" alt="goframe">
	    </a>
	    <a href="https://v3.vuejs.org/" target="_blank">
	        <img src="https://img.shields.io/badge/vue.js-vue3.x-green" alt="vue">
	    </a>
	    <a href="https://element-plus.gitee.io/#/zh-CN/component/changelog" target="_blank">
	        <img src="https://img.shields.io/badge/element--plus-%3E1.0.0-blue" alt="element plus">
	    </a>
		<a href="https://www.tslang.cn/" target="_blank">
	        <img src="https://img.shields.io/badge/typescript-%3E4.0.0-blue" alt="typescript">
	    </a>
		<a href="https://vitejs.dev/" target="_blank">
		    <img src="https://img.shields.io/badge/vite-%3E2.0.0-yellow" alt="vite">
		</a>
		<a href="https://gitee.com/lyt-top/vue-next-admin/blob/master/LICENSE" target="_blank">
		    <img src="https://img.shields.io/badge/license-MIT-success" alt="license">
		</a>
	</p>
</div>



## 平台简介
* 基于GFAST v3.2开发的站内即时通讯系统。
* 可用于站内用户之间有即时通讯需求的场景，目前暂无移动端版本。
* 前端采用vue-next-admin 、Vue、Element UI。
* 本项目由<a href="http://www.qjit.cn/" target="_blank"><b>奇讯科技</b></a>团队开发。
* 如您想购买云服务器请先领取阿里云优惠券：[点我进入](https://www.aliyun.com/minisite/goods?userCode=fcor2omk )，腾讯云优惠券：[点我领取](https://cloud.tencent.com/act/cps/redirect?redirect=1062&cps_key=20b1c3842f74986b2894e2c5fcde7ea2&from=console )



## 即时通讯模块已实现的主要功能

1.  用户之间一对一的即时通讯、用户之间多人群组的即时通讯
2.  新建群组、退出群组、修改群组名称
3.  添加群组新成员
4.  消息的置顶、免打扰
5.  群组内的用户进入、退出及公告的发布
6.  目前支持的消息类型：文本、图片
7.  自动保存及向用户发送离线消息
8.  聊天记录自动保存至数据库
9.  用户获取历史聊天记录
10. 用户在线状态及离线状态的显示
11. 自动断线重连
12. 其他功能还在不断的完善中...



## 演示地址
[http://ga.g-fast.cn/syscenter](http://ga.g-fast.cn/syscenter)
账号：demo  密码：123456
## 配置
项目数据库文件 `resource/data/gfast-v32-roomchat.sql` 创建数据库导入后修改配置 `manifest/config/config.yaml.bak` 复制改为`manifest/config/config.yaml`  

其中gfToken配置
```yaml
gfToken:
  cacheKey: "gfToken_"   #缓存前缀
  timeOut: 10800         #token超时时间（秒）
  maxRefresh: 5400       #token自动刷新时间（秒）
  multiLogin: true       #是否允许一个账号多人同时登录
  encryptKey: "49c54195e750b04e74a8429b17896586"    #加密key (32位)
  cacheModel: "redis"    #存储引擎 （memory使用内存|redis使用redis）
  excludePaths:          #排除不做登录验证的路由地址
    - "/api/v1/system/login"
```

项目为前后端分离，前端地址：

github地址：[https://github.com/ynqxkj007/gfast-im-ui](https://github.com/ynqxkj007/gfast-im-ui)



## gfast的文档地址
> [http://doc.g-fast.cn/docs/gfast32](http://doc.g-fast.cn/docs/gfast32)

## gfast的相关视频
[https://space.bilibili.com/254192571/channel/seriesdetail?sid=223204](https://space.bilibili.com/254192571/channel/seriesdetail?sid=223204)

## 演示图

<table>
    <tr>
        <td><img src="http://v3.g-fast.cn/upload_file/2023-12-14/cxnyxz83al8hfczrai.png"/></td>
        <td><img src="http://v3.g-fast.cn/upload_file/2023-12-14/cxnyxpfhkuxi4onmx6.png"/></td>
    </tr>
</table>

## 感谢(排名不分先后)
> gf框架 [https://github.com/gogf/gf](https://github.com/gogf/gf)
>
> vue-next-admin [https://gitee.com/lyt-top/vue-next-admin](https://gitee.com/lyt-top/vue-next-admin)
>
> swaggo [https://github.com/swaggo/swag](https://github.com/swaggo/swag)
>
>gtoken [https://github.com/goflyfox/gtoken](https://github.com/goflyfox/gtoken)
>
>casbin [https://github.com/casbin/casbin](https://github.com/casbin/casbin)


PHP开源工作流引擎tpflow   [https://gitee.com/ntdgg/tpflow](https://gitee.com/ntdgg/tpflow)

CCflow 国内最优秀的开源流程引擎  [https://gitee.com/opencc/ccflow](https://gitee.com/opencc/ccflow)

## 交流QQ群

> <img src="https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2022-04-19/qqcode.png"/>  

> 感谢你使用GFast,公司团队精力时间有限，因此我们不再提供免费的技术服务，目前Gfast QQ交流群有部分用户进行了捐赠，捐赠后请联系作者进vip用户群，vip群中问题将得到优先解答，同时也会根据您的需求进行分析和优先安排，vip群也会提供Gfast的其它福利。
> 同时您也可以联系我们，雇佣我们团队为您干活，谢谢合作！
>快来加入群聊【Gfast框架交流群】(1群：865697297-已满，2群：444129379)，发现精彩内容，记得备注加群来意。

## 免责声明：
> 1、Gfast仅限自己学习使用，一切商业行为与Gfast无关。

> 2、用户不得利用Gfast从事非法行为，用户应当合法合规的使用，发现用户在使用产品时有任何的非法行为，Gfast有权配合有关机关进行调查或向政府部门举报，Gfast不承担用户因非法行为造成的任何法律责任，一切法律责任由用户自行承担，如因用户使用造成第三方损害的，用户应当依法予以赔偿。

> 3、所有与使用Gfast相关的资源直接风险均由用户承担。


## 商用说明
> 商用注意事项
如果您将此项目用于商业用途，请遵守Apache2.0协议并保留作者技术支持声明。

* GFast快速开发平台采用Apache-2.0技术协议
* 二次开发如用于商业性质或开源竞品请不要删除和修改GFast源码头部的版权与作者声明及出处
* 允许进行商用，但是不允许二次开源出来并进行收费
* 我们已经申请了相关的软件著作权和相关登记（证书号:软著登字第7511736号）
* 如果您在自己的项目中使用了我们项目中的扩展或模块，请在项目介绍中进行明确说明

## 支持开源
如果您喜爱gfast，请给常熬夜的作者来杯咖啡吧！<a href="https://ys0abw.yuque.com/ys0abw/ephcr9/zo38ua" target="_blank"> 点我送咖啡</a>

## [感谢JetBrains提供的免费GoLand](https://jb.gg/OpenSource)
[![avatar](https://camo.githubusercontent.com/323657c6e81419b8e151e9da4c71f409e3fcc65d630535170c59fe4807dbc905/68747470733a2f2f676f6672616d652e6f72672f646f776e6c6f61642f7468756d626e61696c732f313131343131392f6a6574627261696e732e706e67)](https://jb.gg/OpenSource)
