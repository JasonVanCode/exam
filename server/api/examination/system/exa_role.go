package system

import (
	"examination/server/global"
	"examination/server/model/common/request"
	"examination/server/model/common/response"
	"examination/server/utils"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type RoleApi struct{}

// GetRoleList
// @Tags      Menu
// @Summary   角色列表
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.PageInfo                                        true  "页码, 每页大小"
// @Success   200   {object}  response.Response{data=response.PageResult,msg=string}  "分页获取基础menu列表,返回包括列表,总数,页码,每页数量"
// @Router    /menu/getMenuList [post]
func (a *RoleApi) GetRoleList(c *gin.Context) {
	var pageInfo request.PageInfos
	err := c.ShouldBindJSON(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	err = utils.Verify(pageInfo, utils.PageInfoVerify)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	menuList, total, err := roleService.GetRoleList(pageInfo)
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}
	response.OkWithDetaileds(response.RolePageResult{
		HitCount:    true,
		SearchCount: true,
		Records:     menuList,
		Total:       total,
		Pages:       pageInfo.Current,
		Size:        pageInfo.Size,
		Current:     1,
	}, "获取成功", c, true)
}

// GetList
// @Tags      Menu
// @Summary   角色列表
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.PageInfo                                        true  "页码, 每页大小"
// @Success   200   {object}  response.Response{data=response.PageResult,msg=string}  "分页获取基础menu列表,返回包括列表,总数,页码,每页数量"
// @Router    /menu/getMenuList [post]
func (a *RoleApi) GetList(c *gin.Context) {

	menuList, err := roleService.GetList()
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}
	response.OkWithDetaileds(menuList, "获取成功", c, true)
}
