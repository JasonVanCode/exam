package system

import (
	"examination/server/global"
	"examination/server/model/common/request"
	"examination/server/model/common/response"
	"examination/server/model/examination"
	"examination/server/utils"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type DepartApi struct{}

// GetDepartTree
// @Tags      GetDepartTree
// @Summary   部门tree结构
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body
// @Success   200   {object}
// @Router    /menu/getMenuList [post]
func (b *DepartApi) GetDepartTree(c *gin.Context) {
	list, err := departService.GetDepartTree()
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}
	response.OkWithDetaileds(response.PageResults{
		Records:     list,
		Current:     1,
		HitCount:    false,
		SearchCount: true,
	}, "获取成功", c, true)
}

// SortSort
// @Tags      Sort
// @Summary   修改排序
func (b *DepartApi) SortSort(c *gin.Context) {
	var sortId request.SortId
	err := c.ShouldBindJSON(&sortId)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	err = utils.Verify(sortId, utils.SortIdVerify)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	err = departService.SavesortId(sortId)
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}

	response.OkWithDetailed(nil, "修改成功", c)
}

// AddDepart
// @Tags      Sort
// @Summary   修改排序
func (b *DepartApi) AddDepart(c *gin.Context) {
	var sysDepart examination.SysDepart
	err := c.ShouldBindJSON(&sysDepart)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	err = utils.Verify(sysDepart, utils.DepartVerify)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if sysDepart.ID == 0 {
		err = departService.AddDepart(sysDepart)
	} else {
		err = departService.SaveDepart(sysDepart)
	}

	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}

	response.OkWithDetailed(nil, "添加成功", c)
}

// DepartDetail
// @Tags      Sort
// @Summary   查看单个部门
func (b *DepartApi) DepartDetail(c *gin.Context) {
	var getId request.GetById
	err := c.ShouldBindJSON(&getId)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	err = utils.Verify(getId, utils.IdVerify)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	list, err := departService.Departdetail(getId)
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}

	response.OkWithDetailed(list, "添加成功", c)
}

// Detail
// @Tags      DepartDelete
// @Summary   删除试题

func (a *DepartApi) DepartDelete(c *gin.Context) {
	var getId request.IdsReq
	err := c.ShouldBindJSON(&getId)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	err = utils.Verify(getId, utils.IdVerify)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	err = departService.DepartDelete(getId)
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}
	response.OkWithDetaileds(nil, "获取成功", c, true)
}
