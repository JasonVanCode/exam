package examination

import (
	"examination/server/api/examination"
	"github.com/gin-gonic/gin"
)

type RepoRouter struct{}

func (e *RepoRouter) InitRepoRouter(Router *gin.RouterGroup) {
	customerRouter := Router.Group("repo")

	sRepo := Router.Group("exam/api/qu/qu")

	repoApi := examination.ApiGroupApp.SystemApiGroup.RepoApi
	{
		customerRouter.POST("getRepoList", repoApi.GetQuList) // 试题列表
		customerRouter.POST("Detail", repoApi.Detail)         // 试题详情
		customerRouter.POST("qianming", repoApi.Qianming)     // 试题详情
	}
	{
		sRepo.POST("save", repoApi.SaveRepo)   // 添加修改试题
		sRepo.POST("delete", repoApi.DeleteQu) // 删除试题
	}

}
