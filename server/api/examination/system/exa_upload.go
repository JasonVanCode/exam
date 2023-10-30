package system

import (
	"examination/server/global"
	"examination/server/model/common/response"
	"examination/server/model/examination"
	req "examination/server/model/examination/response"
	"examination/server/utils"
	"fmt"
	"github.com/360EntSecGroup-Skylar/excelize"
	"github.com/gin-gonic/gin"
	"github.com/qiniu/api.v7/v7/auth/qbox"
	"github.com/qiniu/api.v7/v7/storage"
	"go.uber.org/zap"
	"strconv"
	"strings"
)

type SystemUploadApi struct{}

func (s *SystemUploadApi) Shangc(c *gin.Context) {
	accessKey := "gHv_GCSWqhF99WUGA4pGEhUa5V3UjNVfQT41lqx-"
	secretKey := "k5iV9gJ8zyGcGxt8zBoUUyABWcY0zjxz40YH5P9D"
	bucket := "kgkj-01"
	putPolicy := storage.PutPolicy{
		Scope: bucket,
	}

	putPolicy.Expires = 7200
	mac := qbox.NewMac(accessKey, secretKey)
	upToken := putPolicy.UploadToken(mac)
	fmt.Println(upToken)
	response.OkWithDetailed(upToken, "获取成功", c)
}

func (s *SystemUploadApi) Daoru(c *gin.Context) {

	form, _ := c.MultipartForm()
	f, ok := form.File["file"]
	if !ok {
		response.FailWithMessage("上传失败", c)
		return
	}
	header := f[0]
	fileInfo, err := uploadService.UploadFile(header, "0")
	if err != nil {
		global.GVA_LOG.Error("上传失败!", zap.Error(err))
		response.FailWithMessage("上传失败", c)
		return
	}
	//fmt.Println(fileInfo.Url)
	//fmt.Println(fileInfo.Name)
	//var addDaoru []examination.SysUser

	excel := ReadExcel(fileInfo.Url)
	fmt.Println(excel)
	//for i, row := range excel {
	//	addDaoru = append(addDaoru, examination.SysUser{UserName:})
	//
	//}
	//err = examService.FillOperAnswer(quId, paperId, fileInfo.Url, fileInfo.Name)
	//if err != nil {
	//	global.GVA_LOG.Error("数据更新失败!", zap.Error(err))
	//	response.FailWithMessage("数据更新失败", c)
	//	return
	//}
	response.OkWithDetailed(fileInfo, "上传成功", c)
}

func ReadExcel(filename string) error {

	f, err := excelize.OpenFile(filename)
	if err != nil {
		fmt.Println("读取excel文件出错", err.Error())
		return err
	}
	sheets := f.GetSheetMap()
	fmt.Println(sheets)
	sheet1 := sheets[1]
	fmt.Println("第一个工作表", sheet1)
	rows := f.GetRows(sheet1)
	//cols := []string{}
	fmt.Println("rows", rows)
	var addDaoru []examination.SysUser
	for i, row := range rows {
		if i != 0 {

			password := row[1]
			password = string([]rune(password)[len([]rune(password))-6:])
			password = utils.BcryptHash(password)

			departId, _ := strconv.Atoi(row[3])
			addDaoru = append(addDaoru, examination.SysUser{UserName: row[0], Password: password, Identification: row[1], RealName: row[2], RoleIds: "student", DepartId: departId})
		}
	}
	err = global.GVA_DB.Create(&addDaoru).Error
	if err != nil {
		fmt.Println("读取excel文件出错", err.Error())
		return err
	}
	return nil
}

// UploadFile
// @Tags      UploadFile
// @Summary   上传图片
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      system.SysApi                  true  "api路径, api中文描述, api组, 方法"
// @Success   200   {object}  response.Response{msg=string}  "创建基础api"
// @Router    /api/createApi [post]
func (s *SystemUploadApi) UploadFile(c *gin.Context) {
	var resp []req.UploadResponse
	form, _ := c.MultipartForm()

	// 获取所有图片
	//uuids, ok := form.Value["uuids"]
	//if !ok {
	//	response.FailWithMessage("缺少必填参数uuids", c)
	//	return
	//}
	//if len(uuids) == 0 {
	//	response.FailWithMessage("缺少必填参数uuids", c)
	//	return
	//}
	//uuidsArr := strings.Split(uuids[0], ",")
	//for _, uuidstr := range uuidsArr {
	//	header := form.File[uuidstr][0]
	//	fileInfo, err := uploadService.UploadFile(header, "0")
	//	if err != nil {
	//		global.GVA_LOG.Error("修改数据库链接失败!", zap.Error(err))
	//		response.FailWithMessage("修改数据库链接失败", c)
	//		return
	//	}
	//	resp = append(resp, req.UploadResponse{
	//		uuidstr,
	//		fileInfo.Url,
	//	})
	//}

	header := form.File["file"][0]
	fileInfo, err := uploadService.UploadFile(header, "0")
	if err != nil {
		global.GVA_LOG.Error("修改数据库链接失败!", zap.Error(err))
		response.FailWithMessage("修改数据库链接失败", c)
		return
	}
	resp = append(resp, req.UploadResponse{
		fileInfo.Url,
	})

	response.OkWithDetailed(resp, "获取成功", c)
}

// UploadLocal
// @Tags      UploadLocal
// @Summary   上传文件
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param
// @Success
// @Router    /api/createApi [post]
func (s *SystemUploadApi) UploadLocal(c *gin.Context) {

	quId, ok := c.GetPostForm("quId")
	if !ok {
		response.FailWithMessage("缺少必填参数", c)
		return
	}
	paperId, ok := c.GetPostForm("paperId")
	if !ok {
		response.FailWithMessage("缺少必填参数", c)
		return
	}

	form, _ := c.MultipartForm()
	f, ok := form.File["file"]
	if !ok {
		response.FailWithMessage("上传失败", c)
		return
	}
	header := f[0]
	fileInfo, err := uploadService.UploadFile(header, "0")
	if err != nil {
		global.GVA_LOG.Error("上传失败!", zap.Error(err))
		response.FailWithMessage("上传失败", c)
		return
	}
	err = examService.FillOperAnswer(quId, paperId, fileInfo.Url, fileInfo.Name)
	if err != nil {
		global.GVA_LOG.Error("数据更新失败!", zap.Error(err))
		response.FailWithMessage("数据更新失败", c)
		return
	}
	response.OkWithDetailed(fileInfo, "上传成功", c)
}

// DownloadFile
// @Tags      DownloadFile
// @Summary   下载文件
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param
// @Success
// @Router    /api/createApi [post]
func (s *SystemUploadApi) DownloadFile(c *gin.Context) {
	id := c.Param("id")
	if id == "" {
		response.FailWithMessage("下载失败", c)
		return
	}
	idInt, err := strconv.Atoi(id)
	if err != nil {
		response.FailWithMessage("下载失败", c)
		return
	}
	info, err := examService.GetOperFileById(idInt)
	if err != nil || info.Answer == "" {
		response.FailWithMessage("下载失败", c)
		return
	}
	splitArrs := strings.Split(info.Answer, "/")
	c.Header("Content-Type", "application/octet-stream")
	c.Header("Content-Disposition", "attachment; filename="+splitArrs[len(splitArrs)-1])
	c.Header("Content-Transfer-Encoding", "binary")
	c.File(info.Answer)
}
