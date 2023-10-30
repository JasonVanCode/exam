package examination

type SysConfigInfo struct {
	Id         int    `json:"id" gorm:"id"`                  // ID
	SiteName   string `json:"siteName" gorm:"site_name"`     // 系统名称
	FrontLogo  string `json:"frontLogo" gorm:"front_logo"`   // 前端LOGO
	BackLogo   string `json:"backLogo" gorm:"back_logo"`     // 后台LOGO
	CopyRight  string `json:"copyRight" gorm:"copy_right"`   // 版权信息
	CreateTime string `json:"createTime" gorm:"create_time"` // 创建时间
	UpdateTime string `json:"updateTime" gorm:"update_time"` // 更新时间
	CreateBy   string `json:"createBy" gorm:"create_by"`     // 创建人
	UpdateBy   string `json:"updateBy" gorm:"update_by"`     // 修改人
	DataFlag   int    `json:"dataFlag" gorm:"data_flag"`     // 数据标识
}

func (SysConfigInfo) TableName() string {
	return "sys_config"
}
