package examination

import (
	"examination/server/api/examination"
	"github.com/gin-gonic/gin"
)

type ExamRouter struct{}

func (e *ExamRouter) InitExamRouter(Router *gin.RouterGroup) {
	rExam := Router.Group("exam/api/exam")
	rUser := Router.Group("exam/api/user")
	rPaper := Router.Group("exam/api/paper")
	rRepo := Router.Group("exam/api/repo")
	rSys := Router.Group("exam/api/sys")
	dSys := Router.Group("exam/api/qu/qu")

	rfile := Router.Group("file")

	upload := examination.ApiGroupApp.SystemApiGroup.SystemUploadApi

	configApi := examination.ApiGroupApp.SystemApiGroup.ExaExamSystemApi
	{
		rExam.POST("exam/paging", configApi.GetExamList)       //
		rExam.POST("exam/save", configApi.SaveExam)            //
		rExam.POST("exam/detail", configApi.ExamDetail)        //
		rExam.POST("exam/online-paging", configApi.OnlineExam) //
		rExam.POST("exam/delete", configApi.DeleteKaoshi)      //
	}
	{
		rUser.POST("exam/paging", configApi.GetExamUserList) //
	}
	{
		rPaper.POST("paper/paging", configApi.GetExamRecord)       //
		rPaper.POST("paper/pagings", configApi.GetExamRecords)     //
		rPaper.POST("paper/check-process", configApi.CheckProcess) //
		rPaper.POST("paper/create-paper", configApi.CreatePaper)   //
		rPaper.POST("paper/paper-result", configApi.PaperResult)   //
		rPaper.POST("paper/paper-detail", configApi.PaperDetail)   //
		rPaper.POST("paper/qu-detail", configApi.QuDetail)         //
		rPaper.POST("paper/fill-answer", configApi.FillAnswer)     //
		rPaper.POST("paper/hand-exam", configApi.HandExam)         //提交试卷
		rPaper.POST("paper/uploadOper", upload.UploadLocal)        //上传实操题
		rPaper.GET("file-download/:id", upload.DownloadFile)       //上传实操题

	}

	repo := examination.ApiGroupApp.SystemApiGroup.RepoApi
	{
		rRepo.POST("paging", repo.GetRepoList)
		rRepo.GET("qulists/:quType", repo.GetQuListByQuType)
		rRepo.POST("save", repo.SaveRepoNew)
		rRepo.POST("detail", repo.RepoDetail)
		rRepo.POST("delete", repo.DeleteRepo)
	}

	depart := examination.ApiGroupApp.SystemApiGroup.DepartApi
	{
		rSys.POST("depart/tree", depart.GetDepartTree)
	}

	repoApi := examination.ApiGroupApp.SystemApiGroup.RoleApi
	{
		rSys.POST("role/list", repoApi.GetList)
	}

	fileApi := examination.ApiGroupApp.SystemApiGroup.SystemUploadApi
	{
		rfile.POST("upload", fileApi.UploadFile)
		rfile.POST("upToken", fileApi.Shangc)
		dSys.POST("import", fileApi.Daoru)
	}

}
