package examination

import (
	"examination/server/api/examination"
	"github.com/gin-gonic/gin"
)

type DepartRouter struct{}

func (e *DepartRouter) InitDepartRouter(Router *gin.RouterGroup) {
	rDepart := Router.Group("exam/api/sys/depart")

	configApi := examination.ApiGroupApp.SystemApiGroup.DepartApi
	{
		rDepart.POST("paging", configApi.GetDepartTree) //部门列表
		rDepart.POST("sort", configApi.SortSort)        //修改排序
		rDepart.POST("save", configApi.AddDepart)       //添加部门
		rDepart.POST("detail", configApi.DepartDetail)  //查看单个部门
		rDepart.POST("delete", configApi.DepartDelete)  //删除单个部门
	}
}
