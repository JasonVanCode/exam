package examination

import (
	"examination/server/global"
	"examination/server/model/common/request"
	"examination/server/model/examination"
	examRes "examination/server/model/examination/response"
)

type DepartService struct{}

// GetDepartTree
// @function: GetDepartTree
// @description: 部门tree结构
// @param: quType string
// @return: list interface{}
func (e *DepartService) GetDepartTree() (list interface{}, err error) {
	var data []examination.SysDepart
	err = global.GVA_DB.Find(&data).Error
	if err != nil {
		return
	}
	list = e.HandleDepartData(data, 0)
	return
}

// 递归查询子项
func (e *DepartService) HandleDepartData(data []examination.SysDepart, pid int) []examRes.DepartTreeRespnse {
	var res []examRes.DepartTreeRespnse
	for _, item := range data {
		if item.ParentId == pid {
			child := e.HandleDepartData(data, int(item.ID))
			sData := examRes.DepartTreeRespnse{
				SysDepart: item,
				Children:  child,
			}
			res = append(res, sData)
		}
	}
	return res
}

// SavesortId
// @function: GetDepartTree
// @description: 部门tree结构
// @param: quType string
// @return: list interface{}
func (e *DepartService) SavesortId(sortId request.SortId) error {
	return global.GVA_DB.Model(&examination.SysDepart{}).
		Select("sort").
		Where("id=?", sortId.Id).
		Updates(map[string]interface{}{
			"sort": sortId.Sort,
		}).Error
}

// AddDepart
// @function: GetDepartTree
// @description: 添加部门
// @param: quType string
// @return: list interface{}
func (e *DepartService) AddDepart(sysDepart examination.SysDepart) (err error) {

	var saveDepart = examination.SysDepart{
		ParentId: sysDepart.ParentId,
		DeptName: sysDepart.DeptName,
	}
	// 否则 附加uuid 密码hash加密 注册
	if err := global.GVA_DB.Model(&examination.SysDepart{}).Create(&saveDepart).Error; err != nil {
		return err
	}
	return nil
}

// SaveDepart
// @function: GetDepartTree
// @description: 添加部门
// @param: quType string
// @return: list interface{}
func (e *DepartService) SaveDepart(sysDepart examination.SysDepart) (err error) {
	// 否则 附加uuid 密码hash加密 注册
	if err := global.GVA_DB.Model(&examination.SysDepart{}).
		Select("parent_id", "dept_name").Where("id = ? ", sysDepart.ID).
		Updates(map[string]interface{}{
			"parent_id": sysDepart.ParentId,
			"dept_name": sysDepart.DeptName,
		}).Error; err != nil {
		return err
	}
	return nil
}

// Departdetail
// @function: GetDepartTree
// @description: 单个部门详情
// @param: quType string
// @return: list interface{}
func (e *DepartService) Departdetail(getId request.GetById) (list interface{}, err error) {

	var sysDepart examination.RetSysDepart
	err = global.GVA_DB.Where("id = ?", getId.ID).First(&sysDepart).Error
	if err != nil {
		return sysDepart, nil
	}

	return sysDepart, err
}

// DepartDelete
// @function: GetDepartTree
// @description: 删除部门
// @param: quType string
// @return: list interface{}
func (e *DepartService) DepartDelete(getId request.IdsReq) (err error) {

	var sysDepart examination.SysDepart

	err = global.GVA_DB.Find(&sysDepart, "id in ?", getId.Ids).Delete(&sysDepart).Error
	if err != nil {
		return err
	}

	return nil
}
