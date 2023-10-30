package examination

import (
	"examination/server/api/examination"
	"github.com/gin-gonic/gin"
)

type RoleRouter struct{}

func (e *RoleRouter) InitRoleRouter(Router *gin.RouterGroup) {
	rRole := Router.Group("exam/api/sys/role")
	repoApi := examination.ApiGroupApp.SystemApiGroup.RoleApi
	{
		rRole.POST("paging", repoApi.GetRoleList) // 试题列表
		//rRole.POST("list	", repoApi.GetList)      // 试题列表å
	}

}
