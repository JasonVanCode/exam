package examination

// 角色
type SysRole struct {
	Id       string `gorm:"column:id" json:"id"`              //角色ID
	RoleName string `gorm:"column:role_name" json:"roleName"` //角色名称
}

func (SysRole) TableName() string {
	return "sys_role"
}
