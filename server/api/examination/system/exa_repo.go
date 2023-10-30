package system

import (
	"examination/server/global"
	"examination/server/model/common/request"
	"examination/server/model/common/response"
	"examination/server/model/examination"
	"examination/server/model/examination/common"
	examReq "examination/server/model/examination/request"
	"examination/server/utils"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type RepoApi struct{}

// GetQuList
// @Tags      Menu
// @Summary   试题列表
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.PageInfo                                        true  "页码, 每页大小"
// @Success   200   {object}  response.Response{data=response.PageResult,msg=string}  "分页获取基础menu列表,返回包括列表,总数,页码,每页数量"
// @Router    /menu/getMenuList [post]
func (a *RepoApi) GetQuList(c *gin.Context) {
	var pageInfo request.PageInfos
	err := c.ShouldBindJSON(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	menuList, total, err := repoService.GetRepoList(pageInfo)
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}
	response.OkWithDetaileds(response.PageResults{
		Records:     menuList,
		Total:       total,
		Pages:       pageInfo.Current,
		Size:        pageInfo.Size,
		Current:     1,
		HitCount:    false,
		SearchCount: true,
	}, "获取成功", c, true)
}

// Detail
// @Tags      Menu
// @Summary   试题列表
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.PageInfo                                        true  "页码, 每页大小"
// @Success   200   {object}  response.Response{data=response.PageResult,msg=string}  "分页获取基础menu列表,返回包括列表,总数,页码,每页数量"
// @Router    /menu/getMenuList [post]

func (a *RepoApi) Detail(c *gin.Context) {
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

	menuList, err := repoService.GetDetail(getId.ID)
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}
	response.OkWithDetaileds(menuList, "获取成功", c, true)
}

// GetRepoList
// @Tags      Menu
// @Summary   题库列表
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.PageInfo                                        true  "页码, 每页大小"
// @Success   200   {object}  response.Response{data=response.PageResult,msg=string}  "分页获取基础menu列表,返回包括列表,总数,页码,每页数量"
// @Router    /menu/getMenuList [post]
func (a *RepoApi) GetRepoList(c *gin.Context) {
	var pageInfo examReq.ExamRepoRequest
	err := c.ShouldBindJSON(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	err = utils.Verify(pageInfo, utils.ExamPageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	list, total, err := examService.GetRepoList(pageInfo)
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}
	response.OkWithDetailed(common.PageResult{
		Total:    total,
		Page:     pageInfo.Current,
		Current:  pageInfo.Current,
		Size:     pageInfo.Size,
		PageSize: pageInfo.Size,
		Records:  list,
	}, "获取成功", c)

}

// GetQuListByQuType
// @Tags      Menu
// @Summary   根据题目类型获取题目列表
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.PageInfo                                        true  "页码, 每页大小"
// @Success   200   {object}  response.Response{data=response.PageResult,msg=string}  "分页获取基础menu列表,返回包括列表,总数,页码,每页数量"
// @Router    /menu/getMenuList [post]
func (a *RepoApi) GetQuListByQuType(c *gin.Context) {
	quType := c.Param("quType")

	if quType == "" {
		response.FailWithMessage("缺少必填参数", c)
		return
	}
	list, err := examService.GetQuListByQuType(quType)
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}
	response.OkWithDetailed(list, "获取成功", c)
}

// SaveRepo
// @Tags      SaveRepo
// @Summary   保存题库
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body                                     true  "页码, 每页大小"
// @Success   200   {object}
// @Router    /menu/getMenuList [post]
func (a *RepoApi) SaveRepo(c *gin.Context) {

	var r examination.ElQuInfo

	err := c.ShouldBindJSON(&r)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	err = utils.Verify(r, utils.ElQuInfoVerify)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	if r.ID == 0 {
		err = repoService.AddQuList(r)
	} else {
		err = repoService.SaveQuList(r)
	}

	if err != nil {
		global.GVA_LOG.Error("数据保存失败!", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
	}
	response.OkWithDetailed(r, "添加成功", c)
}

// DeleteQu
// @Tags      SaveRepo
// @Summary   保存题库
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body                                     true  "页码, 每页大小"
// @Success   200   {object}
// @Router    /menu/getMenuList [post]
func (a *RepoApi) DeleteQu(c *gin.Context) {
	var ids request.IdsReq

	err := c.ShouldBindJSON(&ids)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	err = utils.Verify(ids, utils.IdVerify)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	err = repoService.DeleteQu(ids)

	if err != nil {
		global.GVA_LOG.Error("数据保存失败!", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
	}
	response.OkWithDetailed(ids, "添加成功", c)
}

// Qianming
// @Tags      SystemCompany
// @Summary   添加试题
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Success   200   {object}  response.Response{msg=string}  "创建基础api"
// @Router    /company/addProductionCapacityDetai [post]
func (s *RepoApi) Qianming(c *gin.Context) {

	//h := sha1.New()
	//h.Write([]byte("/ivc/cms/config/getuserregion"))
	//sha1HttpString := h.Sum(nil)
	//
	//var hashFunc = sha1.New
	//h = hmac.New(hashFunc, []byte("ve9kcIOTSH0b6a4WyRqATgxFOM7zeAcE"))
	//h.Write([]byte("1681624980;1681628580"))
	//signKey := h.Sum(nil)
	//fmt.Println(sha1HttpString)
	//fmt.Println(signKey)
	//response.OkWithDetailed(signKey, "添加成功", c)

	var r examination.ElQuInfo
	err := c.ShouldBindJSON(&r)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	err = utils.Verify(r, utils.ElQuInfoVerify)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	err = repoService.AddQuList(r)
	if err != nil {
		global.GVA_LOG.Error("数据保存失败!", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
	}
	response.OkWithDetailed(nil, "添加成功", c)

}

// SaveRepoNew
// @Tags      SaveRepoNew
// @Summary   保存题库
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body                                     true  "页码, 每页大小"
// @Success   200   {object}
// @Router    /menu/getMenuList [post]
func (a *RepoApi) SaveRepoNew(c *gin.Context) {

	var info examReq.SetRepoRequest
	err := c.ShouldBindJSON(&info)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	err = utils.Verify(info, utils.SetRepoInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if info.Id > 0 {
		err = repoService.UpdRepo(info)
	} else {
		err = repoService.SaveRepo(info)

	}
	if err != nil {
		global.GVA_LOG.Error("添加失败!", zap.Error(err))
		response.FailWithMessage("添加失败", c)
		return
	}
	response.OkWithDetailed(nil, "成功", c)
}

// RepoDetail
// @Tags      RepoDetail
// @Summary   题库详情
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body                                     true  "页码, 每页大小"
// @Success   200   {object}
// @Router    /menu/getMenuList [post]
func (a *RepoApi) RepoDetail(c *gin.Context) {

	var info examReq.RepoDetailForm
	err := c.ShouldBindJSON(&info)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	if info.Id == 0 {
		response.FailWithMessage("缺少必填参数", c)
		return
	}

	list, err := repoService.RepoDetail(info)
	if err != nil {
		global.GVA_LOG.Error("添加失败!", zap.Error(err))
		response.FailWithMessage("添加失败", c)
		return
	}
	response.OkWithDetailed(list, "成功", c)
}

// DeleteRepo
// @Tags      DeleteRepo
// @Summary   删除题库
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body                                     true  "页码, 每页大小"
// @Success   200   {object}
// @Router    /menu/getMenuList [post]
func (a *RepoApi) DeleteRepo(c *gin.Context) {
	var info examReq.DelRepo

	err := c.ShouldBindJSON(&info)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	if len(info.Ids) == 0 {
		response.FailWithMessage("缺少必填参数", c)
		return
	}
	err = repoService.DeleteRepo(info.Ids)
	if err != nil {
		global.GVA_LOG.Error("题库删除失败!", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
	}
	response.OkWithDetailed(nil, "删除成功", c)
}
