package examination

import (
	"examination/server/global"
	"time"
)

type SysUser struct {
	global.GVA_MODEL
	Identification string    `gorm:"column:identification" json:"identification"` //身份证
	UserName       string    `gorm:"column:user_name" json:"userName"`            //用户名
	RealName       string    `gorm:"column:real_name" json:"realName"`            //真实姓名
	Password       string    `gorm:"column:password" json:"password"`             //密码
	Salt           string    `gorm:"column:salt" json:"salt"`                     //密码盐
	RoleIds        string    `gorm:"column:role_ids" json:"roleIds"`              //角色列表
	DepartId       int       `gorm:"column:depart_id" json:"departId"`            //部门ID
	State          int       `gorm:"column:state" json:"state"`                   //状态
	DataFlag       int       `gorm:"column:data_flag" json:"dataFlag"`            //0正常,1隐藏
	Depart         SysDepart `gorm:"foreignKey:DepartId" json:"depart"`
}

type SysUserRet struct {
	ID             uint      `gorm:"column:id" json:"id"`
	Identification string    `gorm:"column:identification" json:"identification"` //身份证
	Token          string    `json:"token" gorm:"column:token"`                   //用户名
	UserName       string    `gorm:"column:userName" json:"userName"`             //用户名
	RealName       string    `gorm:"column:realName" json:"realName"`             //真实姓名
	RoleIds        string    `gorm:"column:roleIds" json:"roleIds"`               //角色列表
	DepartId       int       `gorm:"column:departId" json:"departId"`             //部门ID
	CreateTime     time.Time `gorm:"column:createTime" json:"createTime"`         //创建时间
	UpdateTime     time.Time `gorm:"column:updateTime" json:"updateTime"`         //创建时间
	State          int       `gorm:"column:state" json:"state"`                   //状态
	Roles          []string  `gorm:"column:roles" json:"roles"`                   //0正常,1隐藏
	ExamId         int       `json:"examId"`
}

func (SysUser) TableName() string {
	return "sys_user"
}
