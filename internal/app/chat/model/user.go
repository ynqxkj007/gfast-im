package model

import (
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	systemEntity "github.com/tiger1103/gfast/v3/internal/app/system/model/entity"
)

type SysUserSuper struct {
	systemEntity.SysUser
}

func NewSysUserSuper() *SysUserSuper {
	return &SysUserSuper{}
}

func (super *SysUserSuper) Get(id uint64) (err error) {
	err = g.DB().Model("sys_user").Where("id = ?", id).Scan(&super)
	return
}

func (super *SysUserSuper) IsEmpty() bool {
	return super == nil || super.Id == 0
}

type SysUserSuperList []*SysUserSuper

func NewSysUserSuperList() SysUserSuperList {
	return SysUserSuperList{}
}

func (list *SysUserSuperList) Find(h ...gdb.ModelHandler) (err error) {
	err = g.DB().Model("sys_user").Handler(h...).Scan(list)
	return
}

func (list SysUserSuperList) Len() int {
	return len(list)
}
