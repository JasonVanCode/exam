package system

import "examination/server/service"

type ApiGroup struct {
	ExaminationConfigsApi
	UserApi
	RepoApi
	ExaExamSystemApi
	RoleApi
	DepartApi
	SystemUploadApi
}

var (
	configService = service.ServiceGroupApp.ExaminationServiceGroup.ConfigService
	usersService  = service.ServiceGroupApp.ExaminationServiceGroup.UserService
	jwtService    = service.ServiceGroupApp.SystemServiceGroup.JwtService
	repoService   = service.ServiceGroupApp.ExaminationServiceGroup.RepoService
	examService   = service.ServiceGroupApp.ExaminationServiceGroup.ExamService
	roleService   = service.ServiceGroupApp.ExaminationServiceGroup.RoleService
	departService = service.ServiceGroupApp.ExaminationServiceGroup.DepartService
	uploadService = service.ServiceGroupApp.ExaminationServiceGroup.UploadService
)
