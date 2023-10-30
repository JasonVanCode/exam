package system

import (
	"examination/server/global"
	"examination/server/model/common/request"
	"examination/server/model/common/response"
	"examination/server/model/examination/common"
	examReq "examination/server/model/examination/request"
	"examination/server/utils"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

// 考试
type ExaExamSystemApi struct{}

// GetExamList
// @Tags      ExaExamSystemApi
// @Summary   考试列表
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.PageInfo                                        true  "页码, 每页大小"
// @Success   200   {object}  response.Response{data=response.PageResult,msg=string}  "分页获取用户列表,返回包括列表,总数,页码,每页数量"
// @Router    /exam/api/exam/exam/paging [post]
func (b *ExaExamSystemApi) GetExamList(c *gin.Context) {
	var pageInfo examReq.ExamListRequest
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
	list, total, err := examService.GetExamList(pageInfo)
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

// GetExamUserList
// @Tags      ExaExamSystemApi
// @Summary   考试人员列表
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.PageInfo
// @Success   200   {object}  response.Response{data=response.PageResult,msg=string}
// @Router    /exam/api/user/exam/paging [post]
func (b *ExaExamSystemApi) GetExamUserList(c *gin.Context) {
	var pageInfo examReq.ExamUserListRequest
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
	list, total, err := examService.GetExamUserList(pageInfo)
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

// GetExamRecord
// @Tags      GetExamRecord
// @Summary   考试记录
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.PageInfo
// @Success   200   {object}  response.Response{data=response.PageResult,msg=string}
// @Router    /exam/api/paper/paper/paging [post]
func (b *ExaExamSystemApi) GetExamRecord(c *gin.Context) {
	var pageInfo examReq.PaperRecordRequest
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
	list, total, err := examService.GetExamRecord(pageInfo)
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

// GetExamRecords
// @Tags      GetExamRecords
// @Summary   考试记录
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.PageInfo
// @Success   200   {object}  response.Response{data=response.PageResult,msg=string}
// @Router    /exam/api/paper/paper/paging [post]
func (b *ExaExamSystemApi) GetExamRecords(c *gin.Context) {
	var pageInfo examReq.PaperRecordRequest
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
	list, total, err := examService.GetExamRecords(pageInfo)
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

// SaveExam
// @Tags      SaveExam
// @Summary   保存试卷
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body
// @Success   200   {object}
// @Router    /menu/getMenuList [post]
func (a *ExaExamSystemApi) SaveExam(c *gin.Context) {
	var info examReq.ExamFormnRequest
	err := c.ShouldBindJSON(&info)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	//新增
	if info.Id == 0 {
		err = examService.SaveExam(info)
	} else {
		err = examService.UpdExam(info)
	}

	if err != nil {
		global.GVA_LOG.Error("添加失败!", zap.Error(err))
		response.FailWithMessage("添加失败", c)
		return
	}
	response.OkWithDetailed(nil, "添加成功", c)
}

// ExamDetail
// @Tags      ExamDetail
// @Summary   试卷详情
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body
// @Success   200   {object}
// @Router    /menu/getMenuList [post]
func (a *ExaExamSystemApi) ExamDetail(c *gin.Context) {
	var info examReq.ExamDetail
	err := c.ShouldBindJSON(&info)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	err = utils.Verify(info, utils.ExamPageInfo)
	if info.Id == 0 {
		response.FailWithMessage("缺少必填参数", c)
		return
	}
	list, err := examService.ExamDetail(info.Id)
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}
	response.OkWithDetailed(list, "获取成功", c)
}

// OnlineExam
// @Tags      OnlineExam
// @Summary   我的考试列表
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.PageInfo                                        true  "页码, 每页大小"
// @Success   200   {object}  response.Response{data=response.PageResult,msg=string}  "分页获取用户列表,返回包括列表,总数,页码,每页数量"
// @Router    /exam/api/exam/exam/paging [post]
func (b *ExaExamSystemApi) OnlineExam(c *gin.Context) {
	var pageInfo examReq.ExamListRequest
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
	userId := utils.GetUserID(c)
	userInfo, err := usersService.GetUserById(userId)
	if err != nil {
		global.GVA_LOG.Error("获取用户信息失败!", zap.Error(err))
		response.FailWithMessage("获取用户信息失败", c)
	}
	list, total, err := examService.OnlineExam(pageInfo, userInfo)
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

func (b *ExaExamSystemApi) CheckProcess(c *gin.Context) {
	response.OkWithDetailed(nil, "获取成功", c)
}

func (b *ExaExamSystemApi) PaperResult(c *gin.Context) {
	var info examReq.PaperResult
	err := c.ShouldBindJSON(&info)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if info.Id == 0 {
		response.FailWithMessage("缺少必填参数", c)
		return
	}
	list, err := examService.PaperResult(info.Id)
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}
	response.OkWithDetailed(list, "获取成功", c)
}

// CreatePaper
// @Tags      CreatePaper
// @Summary   考试
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body
// @Success   200   {object}
// @Router    /menu/getMenuList [post]
func (a *ExaExamSystemApi) CreatePaper(c *gin.Context) {
	var info examReq.CreatePaper
	err := c.ShouldBindJSON(&info)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	err = utils.Verify(info, utils.CreatePaperVerify)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	userId := utils.GetUserID(c)
	userInfo, err := usersService.GetUserById(userId)
	if err != nil {
		global.GVA_LOG.Error("获取用户信息失败!", zap.Error(err))
		response.FailWithMessage("获取用户信息失败", c)
	}
	list, err := examService.CreatePaper(info, userInfo)
	if err != nil {
		global.GVA_LOG.Error("添加失败!", zap.Error(err))
		response.FailWithMessage("添加失败", c)
		return
	}
	response.OkWithDetailed(struct {
		Id uint `json:"id"`
	}{
		Id: list.ID,
	}, "添加成功", c)
}

// PaperDetail
// @Tags      PaperDetail
// @Summary
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body
// @Success   200   {object}
// @Router    /menu/getMenuList [post]
func (b *ExaExamSystemApi) PaperDetail(c *gin.Context) {
	var info examReq.PaperDetailForm
	err := c.ShouldBindJSON(&info)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if info.Id == 0 {
		response.FailWithMessage("缺少必填参数", c)
		return
	}
	list, err := examService.PaperDetail(info.Id)
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}
	response.OkWithDetailed(list, "获取成功", c)
}

// QuDetail
// @Tags      QuDetail
// @Summary
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body
// @Success   200   {object}
// @Router    /menu/getMenuList [post]
func (b *ExaExamSystemApi) QuDetail(c *gin.Context) {
	var info examReq.QuDetailForm
	err := c.ShouldBindJSON(&info)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	err = utils.Verify(info, utils.QuDetailInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	list, err := examService.QuDetail(info.PaperId, info.QuId)
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}
	response.OkWithDetailed(list, "获取成功", c)
}

// FillAnswer
// @Tags      FillAnswer
// @Summary
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body
// @Success   200   {object}
// @Router    /menu/getMenuList [post]
func (b *ExaExamSystemApi) FillAnswer(c *gin.Context) {
	var info examReq.FillAnswerForm
	err := c.ShouldBindJSON(&info)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	err = utils.Verify(info, utils.FillAnswerVerify)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if len(info.Answers) == 0 {
		response.OkWithDetailed(nil, "成功", c)
		return
	}
	err = examService.FillAnswer(info)
	if err != nil {
		global.GVA_LOG.Error("失败!", zap.Error(err))
		response.FailWithMessage("失败", c)
		return
	}
	response.OkWithDetailed(nil, "成功", c)
}

// HandExam
// @Tags      HandExam
// @Summary
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body
// @Success   200   {object}
// @Router    /menu/getMenuList [post]
func (b *ExaExamSystemApi) HandExam(c *gin.Context) {
	var info examReq.HandExamForm
	err := c.ShouldBindJSON(&info)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if info.Id == 0 {
		response.FailWithMessage("缺少必填参数", c)
		return
	}
	err = examService.HandExam(info.Id)
	if err != nil {
		global.GVA_LOG.Error("失败!", zap.Error(err))
		response.FailWithMessage("失败", c)
		return
	}
	response.OkWithDetailed(nil, "成功", c)
}

// DeleteKaoshi
// @Tags      HandExam
// @Summary
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body
// @Success   200   {object}
// @Router    /menu/getMenuList [post]
func (a *ExaExamSystemApi) DeleteKaoshi(c *gin.Context) {
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

	err = examService.Deletekaoshi(ids)

	if err != nil {
		global.GVA_LOG.Error("数据保存失败!", zap.Error(err))
		response.FailWithMessage(err.Error(), c)
	}
	response.OkWithDetailed(ids, "添加成功", c)
}
