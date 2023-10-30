package system

import (
	"examination/server/global"
	"examination/server/model/common/request"
	"examination/server/model/common/response"
	"examination/server/model/examination"
	systemReq "examination/server/model/system/request"
	"examination/server/utils"
	"fmt"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
	"time"
)

type UserApi struct{}

// Login
// @Tags     Base
// @Summary  用户登录
// @Produce   application/json
// @Param    data  body      systemReq.Login                                             true  "用户名, 密码, 验证码"
// @Success  200   {object}  response.Response{data=systemRes.LoginResponse,msg=string}  "返回包括用户信息,token,过期时间"
// @Router   /base/login [post]
func (b *UserApi) Login(c *gin.Context) {
	var l systemReq.Loginexa
	err := c.ShouldBindJSON(&l)
	fmt.Println(l)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	err = utils.Verify(l, utils.LoginexaVerify)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	u := &examination.SysUser{UserName: l.Username, Password: l.Password}
	user, err := usersService.Login(u)
	if err != nil {
		global.GVA_LOG.Error("登陆失败! 用户名不存在或者密码错误!", zap.Error(err))
		// 验证码次数+1
		response.FailWithMessage("用户名不存在或者密码错误", c)
		return
	}
	if user.State != 0 {
		global.GVA_LOG.Error("登陆失败! 用户被禁止登录!")
		// 验证码次数+1
		response.FailWithMessage("用户被禁止登录", c)
		return
	}
	var sysUserRet examination.SysUserRet
	sysUserRet.ID = user.ID
	sysUserRet.DepartId = user.DepartId
	sysUserRet.Identification = user.Identification
	sysUserRet.RealName = user.RealName
	sysUserRet.RoleIds = user.RoleIds
	sysUserRet.State = user.State
	sysUserRet.UserName = user.UserName
	sysUserRet.Roles = append(sysUserRet.Roles, user.RoleIds)

	b.TokenNext(c, sysUserRet)
}

// Register
// @Tags     SysUser
// @Summary  用户注册账号
// @Produce   application/json
// @Param    data  body      systemReq.Register                                            true  "用户名, 昵称, 密码, 角色ID"
// @Success  200   {object}  response.Response{data=systemRes.SysUserResponse,msg=string}  "用户注册账号,返回包括用户信息"
// @Router   /user/admin_register [post]
func (b *UserApi) Register(c *gin.Context) {

	var r systemReq.Registers
	err := c.ShouldBindJSON(&r)

	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	err = utils.Verify(r, utils.RegistersVerify)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	password := r.Identification
	password = string([]rune(password)[len([]rune(password))-6:])

	// 结果为 "g你好"
	if r.ID == 0 {
		fmt.Println(1212)
		user := &examination.SysUser{UserName: r.UserName, RealName: r.RealName, Password: password, Identification: r.Identification, RoleIds: r.RoleIds, DepartId: r.DepartId}
		userReturn, err := usersService.Register(*user)
		var sysUserRet examination.SysUserRet
		sysUserRet.ID = userReturn.ID
		sysUserRet.DepartId = user.DepartId
		sysUserRet.RealName = user.RealName
		sysUserRet.RoleIds = user.RoleIds
		sysUserRet.State = user.State
		sysUserRet.UserName = user.UserName
		sysUserRet.Roles = append(sysUserRet.Roles, user.RoleIds)
		if err != nil {
			global.GVA_LOG.Error("注册失败!", zap.Error(err))
			response.FailWithDetailed(userReturn, err.Error(), c)
			return
		}
		response.OkWithDetaileds(sysUserRet, "注册成功", c, true)
	} else {
		fmt.Println(2323)
		user := &examination.SysUser{UserName: r.UserName, RealName: r.RealName, Password: password, Identification: r.Identification, RoleIds: r.RoleIds, DepartId: r.DepartId}
		err := usersService.SaveUser(*user, r.ID)

		response.OkWithDetaileds(err, "修改成功", c, true)

	}

}

// TokenNext 登录以后签发jwt
func (b *UserApi) TokenNext(c *gin.Context, user examination.SysUserRet) {
	j := &utils.JWT{SigningKey: []byte(global.GVA_CONFIG.JWT.SigningKey)} // 唯一签名
	claimsNew := j.CreateClaims(systemReq.BaseClaims{
		ID:       user.ID,
		Username: user.UserName,
	})
	token, err := j.CreateToken(claimsNew)
	if err != nil {
		global.GVA_LOG.Error("获取token失败!", zap.Error(err))
		response.FailWithMessage("获取token失败", c)
		return
	}
	user.Token = token
	if user.RoleIds == "student" {
		examId, err := examService.GetUserExamInfo(user.DepartId, int(user.ID))
		if err != nil || examId == 0 {
			response.FailWithDetailed(nil, "暂无比赛信息", c)
			return
		}
		user.ExamId = int(examId)
	}
	// 查询最近一次的考试信息
	response.OkWithDetaileds(user, "登录成功", c, true)
}

type SysUserRet struct {
	ID         uint      `gorm:"column:id" json:"id"`
	Token      string    `json:"token" gorm:"column:token"`           //用户名
	UserName   string    `gorm:"column:userName" json:"userName"`     //用户名
	RealName   string    `gorm:"column:realName" json:"realName"`     //真实姓名
	RoleIds    string    `gorm:"column:roleIds" json:"roleIds"`       //角色列表
	DepartId   int       `gorm:"column:departId" json:"departId"`     //部门ID
	CreateTime time.Time `gorm:"column:createTime" json:"createTime"` //创建时间
	UpdateTime time.Time `gorm:"column:updateTime" json:"updateTime"` //创建时间
	State      int       `gorm:"column:state" json:"state"`           //状态
	Roles      []string  `gorm:"column:roles" json:"roles"`           //0正常,1隐藏
}

// Init
// @Tags     Base
// @Summary  用户登录
// @Produce   application/json
// @Param    data  body      systemReq.Login                                             true  "用户名, 密码, 验证码"
// @Success  200   {object}  response.Response{data=systemRes.LoginResponse,msg=string}  "返回包括用户信息,token,过期时间"
// @Router   /base/login [post]
func (b *UserApi) Init(c *gin.Context) {
	userId := utils.GetUserID(c)
	if userId == 0 {
		response.FailWithDetailed(gin.H{"reload": true}, "授权已过期,请重新登录", c)
		c.Abort()
		return
	}
	userInfo, err := usersService.GetUserById(userId)
	if err != nil {
		response.FailWithDetailed(gin.H{"reload": true}, "授权已过期,请重新登录", c)
		c.Abort()
		return
	}
	var result = SysUserRet{
		ID:       userInfo.ID,
		Token:    c.Request.Header.Get("x-token"),
		UserName: userInfo.UserName,
		RealName: userInfo.RealName,
		State:    userInfo.State,
		RoleIds:  userInfo.RoleIds,
		Roles: []string{
			userInfo.RoleIds,
		},
		DepartId: userInfo.DepartId,
	}
	response.OkWithDetaileds(result, "验证成功", c, true)

}

// UserList
// @Tags     Base
// @Summary  用户列表
func (b *UserApi) UserList(c *gin.Context) {
	var pageInfo request.PageInfos
	err := c.ShouldBindJSON(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	menuList, total, err := usersService.GetUserList(pageInfo)
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

// DeleteUser
// @Tags     Base
// @Summary  删除
func (b *UserApi) DeleteUser(c *gin.Context) {

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

	err = usersService.DeleteUser(getId)
	if err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
		return
	}
	response.OkWithDetaileds(nil, "删除成功", c, true)

}

// StateUser
// @Tags     Base
// @Summary  修改状态
func (b *UserApi) StateUser(c *gin.Context) {

	var getId request.IdsReqState
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

	err = usersService.StateUser(getId)
	if err != nil {
		global.GVA_LOG.Error("操作失败!", zap.Error(err))
		response.FailWithMessage("操作失败", c)
		return
	}
	response.OkWithDetaileds(nil, "操作成功", c, true)
}
