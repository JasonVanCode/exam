package examination

import "examination/server/global"

// 部门信息
type SysDepart struct {
	global.GVA_MODEL
	DeptType int    `gorm:"column:dept_type" json:"deptType"` //1公司2部门
	ParentId int    `gorm:"column:parent_id" json:"parentId"` //所属上级
	DeptName string `gorm:"column:dept_name" json:"deptName"` //部门名称
	DeptCode string `gorm:"column:dept_code" json:"deptCode"` //部门编码
	Sort     int    `gorm:"column:sort" json:"sort"`          //排序
}

func (SysDepart) TableName() string {
	return "sys_depart"
}

type RetSysDepart struct {
	ID       uint   `gorm:"primarykey" json:"id"`             // 主键ID
	DeptType int    `gorm:"column:dept_type" json:"deptType"` //1公司2部门
	ParentId int    `gorm:"column:parent_id" json:"parentId"` //所属上级
	DeptName string `gorm:"column:dept_name" json:"deptName"` //部门名称
	Sort     int    `gorm:"column:sort" json:"sort"`          //排序
}

func (RetSysDepart) TableName() string {
	return "sys_depart"
}
