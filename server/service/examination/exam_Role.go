package examination

import (
	"examination/server/global"
	"examination/server/model/common/request"
	"examination/server/model/examination"
)

type RoleService struct{}

// GetRoleList
// @function: GetCompanyList
// @description: 角色列表分野
// @param: u model.GcCompany
// @return: list huanbao.GcCompany,total, err error
func (service *RoleService) GetRoleList(info request.PageInfos) (list interface{}, total int64, err error) {
	limit := info.Size
	offset := info.Size * (info.Current - 1)
	db := global.GVA_DB.Model(&examination.SysRole{})
	var sysRole []examination.SysRole
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Order("id desc").Find(&sysRole).Error
	return sysRole, total, err
}

// GetList
// @function: GetList
// @description: 角色列表分野
// @param: u model.GcCompany
// @return: list huanbao.GcCompany,total, err error
func (service *RoleService) GetList() (list interface{}, err error) {

	db := global.GVA_DB.Model(&examination.SysRole{})
	var sysRole []examination.SysRole
	if err != nil {
		return
	}
	err = db.Order("id desc").Find(&sysRole).Error
	return sysRole, err
}
