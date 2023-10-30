package examination

import (
	"examination/server/global"
	"examination/server/model/examination"
	"fmt"
)

type ConfigService struct{}

// getSelectCompanyLists
// @function: getSelectCompanyLists
// @description: 供select 查询公司信息
// @param: u model.GcCompany
// @return: list interface{},err error

func (service *ConfigService) GetConfigDetail(id int) (examConfig *examination.SysConfigInfo, err error) {
	var c examination.SysConfigInfo
	err = global.GVA_DB.Where("id = ?", id).First(&c).Error
	fmt.Println(err)
	return &c, err
}
