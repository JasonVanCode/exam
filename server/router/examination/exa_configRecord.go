package examination

import (
	"examination/server/api/examination"
	"github.com/gin-gonic/gin"
)

type ConfigRouter struct{}

func (e *ConfigRouter) InitConfigRouter(Router *gin.RouterGroup) {
	customerRouter := Router.Group("config")
	configApi := examination.ApiGroupApp.SystemApiGroup.ExaminationConfigsApi
	{
		customerRouter.POST("getConfigDetail", configApi.GetConfigDetail) // 查找配置文件
	}
}
