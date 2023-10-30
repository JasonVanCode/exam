package examination

import (
	"examination/server/api/examination"
	"github.com/gin-gonic/gin"
)

type UsersRouter struct{}

func (e *UsersRouter) InitUsersRouter(Router *gin.RouterGroup) {
	customerRouter := Router.Group("user")

	rUser := Router.Group("exam/api/sys/user")
	sUser := Router.Group("sys/user")
	usersApi := examination.ApiGroupApp.SystemApiGroup.UserApi
	{
		customerRouter.POST("login", usersApi.Login)       // 查找配置文件
		customerRouter.POST("register", usersApi.Register) // 查找配置文件
		customerRouter.Any("info", usersApi.Init)          // 查找配置文件
	}
	{
		rUser.POST("paging", usersApi.UserList)   // 查找配置文件
		rUser.POST("save", usersApi.Register)     // 后台新增用户
		rUser.POST("delete", usersApi.DeleteUser) // 删除用户

	}
	{
		sUser.POST("state", usersApi.StateUser) // 查找配置文件

	}
}
