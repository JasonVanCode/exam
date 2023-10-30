package system

import (
	"examination/server/global"
	"examination/server/model/common/request"
	"examination/server/model/common/response"
	"examination/server/utils"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type ExaminationConfigsApi struct{}

// GetConfigDetail
// @Tags      GetConfigDetail
// @Summary   获取配置信息
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      system.SysApi                  true  "api路径, api中文描述, api组, 方法"
// @Success   200   {object}  response.Response{msg=string}  "创建基础api"
// @Router    /api/createApi [post]
func (b *ExaminationConfigsApi) GetConfigDetail(c *gin.Context) {
	var reqId request.GetById
	//json串绑定到结构体
	err := c.ShouldBindJSON(&reqId)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	//验证参数
	err = utils.Verify(reqId, utils.IdVerify)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	//
	lists, err := configService.GetConfigDetail(reqId.ID)
	//lists, err := productionLine.GetProductionLineLists(reqId.ID)
	if err != nil {
		global.GVA_LOG.Error("GetProductionCapacity数据查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
		return
	}
	response.OkWithDetailed(lists, "查询成功", c)
}

// Inits
// @Tags     Base
// @Summary  用户登录
// @Produce   application/json
// @Param    data  body      systemReq.Login                                             true  "用户名, 密码, 验证码"
// @Success  200   {object}  response.Response{data=systemRes.LoginResponse,msg=string}  "返回包括用户信息,token,过期时间"
// @Router   /base/login [post]
func (b *UserApi) Inits(c *gin.Context) {
	token := c.Request.Header.Get("x-token")
	a, _ := jwtService.GetRedisJWT(token)
	response.OkWithDetailed(a, "登陆", c)

}
