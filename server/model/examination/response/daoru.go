package response

type SysDaoru struct {
	UserName string `gorm:"column:user_name" json:"userName"` //用户名
	RealName string `gorm:"column:real_name" json:"realName"` //真实姓名
	Password string `gorm:"column:password" json:"password"`  //密码
	Salt     string `gorm:"column:salt" json:"salt"`          //密码盐
	RoleIds  string `gorm:"column:role_ids" json:"roleIds"`   //角色列表
	DepartId int    `gorm:"column:depart_id" json:"departId"` //部门ID
	State    int    `gorm:"column:state" json:"state"`        //状态
	DataFlag int    `gorm:"column:data_flag" json:"dataFlag"` //0正常,1隐藏
}
