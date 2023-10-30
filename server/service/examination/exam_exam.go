package examination

import (
	"encoding/json"
	"errors"
	"examination/server/global"
	"examination/server/model/common/request"
	"examination/server/model/examination"
	examReq "examination/server/model/examination/request"
	examRes "examination/server/model/examination/response"
	"fmt"
	"gorm.io/gorm"
	"math"
	"strconv"
	"time"
	"unsafe"
)

type ExamService struct{}

const (
	RadioType     = 1 //单选
	MutiType      = 2 //多选
	JudgeType     = 3 //判断
	OperType      = 4 //实操
	ExamTimeLimit = 1
)

// GetExamList
// @function: GetExamList
// @description: 获取考试列表
// @param: info examReq.ExamListRequest
// @return: list interface{}, total int64, err error
func (e *ExamService) GetExamList(info examReq.ExamListRequest) (list interface{}, total int64, err error) {
	limit := info.Size
	offset := info.Size * (info.Current - 1)
	db := global.GVA_DB.Model(&examination.ElExam{})
	var examList []examination.ElExam
	if info.Params.Title != "" {
		db = db.Where("title like ?", "%"+info.Params.Title+"%")
	}
	if info.Params.StartTime != "" {
		db = db.Where("start_time = ?", info.Params.StartTime)
	}
	if info.Params.EndTime != "" {
		db = db.Where("end_time = ?", info.Params.EndTime)
	}
	if info.Params.OpenType > 0 {
		db = db.Where("open_type = ?", info.Params.OpenType)
	}
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	//排序
	if info.OrderBy != "" {
		db.Order(info.OrderBy)
	} else {
		db.Order("id")
	}
	err = db.Limit(limit).Offset(offset).Find(&examList).Error
	return examList, total, err
}

// GetExamUserList
// @function: GetExamUserList
// @description: 获取考试人员列表
// @param: info examReq.ExamUserListRequest
// @return: list interface{}, total int64, err error
func (e *ExamService) GetExamUserList(info examReq.ExamUserListRequest) (list interface{}, total int64, err error) {
	limit := info.Size
	offset := info.Size * (info.Current - 1)
	var examList []examRes.SearchExamUserResponse
	db := global.GVA_DB.Model(&examination.ElUserExam{}).Select("el_user_exam.*,sys_user.real_name").Joins("left join sys_user on sys_user.id = el_user_exam.user_id")
	if info.Params.RealName != "" {
		db.Where("sys_user.real_name = ?", info.Params.RealName)
	}
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Scan(&examList).Error
	return examList, total, err
}

// GetExamRecord
// @function: GetExamRecord
// @description: 获取考试记录
// @param: info examReq.PaperRecordRequest
// @return: list interface{}, total int64, err error
func (e *ExamService) GetExamRecord(info examReq.PaperRecordRequest) (list interface{}, total int64, err error) {
	limit := info.Size
	offset := info.Size * (info.Current - 1)
	var recordList []examination.ElPaper

	db := global.GVA_DB.Model(&examination.ElPaper{}).Where("user_id = ? and exam_id = ?", info.Params.UserId, info.Params.ExamId)
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Scan(&recordList).Error

	return recordList, total, err
}

// GetExamRecords
// @function: GetExamRecords
// @description: 获取考试记录
// @param: info examReq.PaperRecordRequest
// @return: list interface{}, total int64, err error
func (e *ExamService) GetExamRecords(info examReq.PaperRecordRequest) (list interface{}, total int64, err error) {

	var recordList []examination.RetElUserExam

	db := global.GVA_DB.Model(&examination.ElUserExam{}).Debug().Select("el_user_exam.*,sys_user.real_name").Where("el_user_exam.exam_id = ? ", info.Params.ID).Joins("left join sys_user on sys_user.id = el_user_exam.user_id")

	//db := global.GVA_DB.Model(&examination.RetElUserExam{}).Debug().Preload("UsersList").Where("exam_id = ? ", info.Params.ID)

	err = db.Scan(&recordList).Error

	return recordList, total, err
}

// GetRepoList
// @function: GetRepoList
// @description: 获取题库列表信息
// @param: info examReq.PaperRecordRequest
// @return: list interface{}, total int64, err error
func (e *ExamService) GetRepoList(info examReq.ExamRepoRequest) (list interface{}, total int64, err error) {
	limit := info.Size
	offset := info.Size * (info.Current - 1)
	var repoList []examination.ElRepo
	db := global.GVA_DB.Model(&examination.ElRepo{})
	if info.Params.Title != "" {
		db = db.Where("title like ?", "%"+info.Params.Title+"%")
	}
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Debug().Limit(limit).Offset(offset).Preload("ExamRepo").Preload("ElQuRepo").Find(&repoList).Error
	if err != nil {
		return
	}
	var finalData []examRes.RepoResponse
	for _, v := range repoList {
		radioCount := 0
		multiCount := 0
		judgeCount := 0
		operCount := 0
		for _, vTwo := range v.ElQuRepo {
			if vTwo.QuType == RadioType {
				radioCount += 1
			}
			if vTwo.QuType == MutiType {
				multiCount += 1
			}
			if vTwo.QuType == JudgeType {
				judgeCount += 1
			}
			if vTwo.QuType == OperType {
				operCount += 1
			}

		}
		vData := examRes.RepoResponse{
			Id:         v.ID,
			Title:      v.Title,
			Code:       v.Code,
			Remark:     v.Remark,
			CreateTime: v.CreatedAt,
			RadioCount: radioCount,
			MultiCount: multiCount,
			JudgeCount: judgeCount,
			OperCount:  operCount,
			UpdateTime: v.UpdatedAt,
		}
		finalData = append(finalData, vData)
	}
	return finalData, total, err
}

// GetQuListByQuType
// @function: GetQuListByQuType
// @description: 根据题目类型获取题目列表
// @param: quType string
// @return: list interface{}
func (e *ExamService) GetQuListByQuType(quType string) (list interface{}, err error) {
	var data []examination.ElQuInfo
	err = global.GVA_DB.Where("qu_type = ?", quType).Find(&data).Error
	return data, err
}

// UpdExam
// @function: UpdExam
// @description: 修改考试题目
// @param: info examReq.ExamFormnRequest
// @return:  err error
func (e *ExamService) UpdExam(info examReq.ExamFormnRequest) (err error) {
	var examData = examination.ElExam{
		Title:        info.Title,
		Content:      info.Content,
		OpenType:     info.OpenType,
		TotalScore:   info.TotalScore,
		TotalTime:    info.TotalTime,
		QualifyScore: info.QualifyScore,
		TimeLimit:    0,
		StartTime:    new(global.LocalTime),
		EndTime:      new(global.LocalTime),
	}
	if info.TimeLimit {
		examData.TimeLimit = 1
		if info.StartTime != "" && info.EndTime != "" {
			//sTime, _ := time.Parse("2006-01-02 15:04:05", info.StartTime)
			//eTime, _ := time.Parse("2006-01-02 15:04:05", info.EndTime)

			sTime, _ := time.ParseInLocation("2006-01-02 15:04:05", info.StartTime, time.FixedZone("CST", 8*3600))
			eTime, _ := time.ParseInLocation("2006-01-02 15:04:05", info.EndTime, time.FixedZone("CST", 8*3600))

			*examData.StartTime = global.LocalTime(sTime)
			*examData.EndTime = global.LocalTime(eTime)
		}
	}
	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		// 在事务中执行一些 db 操作（从这里开始，您应该使用 'tx' 而不是 'db'）
		if err := tx.Where("id = ?", info.Id).Updates(&examData).Error; err != nil {
			// 返回任何错误都会回滚事务
			return err
		}
		//部门
		if len(info.DepartIds) > 0 {
			//清除之前的存储数据
			if err = tx.Where("exam_id = ?", info.Id).Delete(&examination.ElExamDepart{}).Error; err != nil {
				return err
			}
			var examDepData []examination.ElExamDepart
			for _, depIds := range info.DepartIds {
				examDepData = append(examDepData, examination.ElExamDepart{
					ExamId:   info.Id,
					DepartId: depIds,
				})
			}
			if err := tx.Debug().Create(&examDepData).Error; err != nil {
				// 返回任何错误都会回滚事务
				return err
			}
		}
		//试卷题目详情
		if len(info.RepoList) > 0 {
			//清除之前的存储数据
			if err = tx.Where("exam_id = ?", info.Id).Delete(&examination.ElExamRepo{}).Error; err != nil {
				return err
			}
			var examRepo []examination.ElExamRepo
			for _, repoItem := range info.RepoList {
				examRepo = append(examRepo, examination.ElExamRepo{
					ExamId:     info.Id,
					RepoId:     repoItem.RepoId,
					JudgeCount: repoItem.JudgeCount,
					JudgeScore: repoItem.JudgeScore,
					MultiCount: repoItem.Multicount,
					MultiScore: repoItem.MultiScore,
					RadioCount: repoItem.RadioCount,
					RadioScore: repoItem.RadioScore,
					SaqCount:   repoItem.SaqCount,
					SaqScore:   repoItem.SagScore,
					TotalJudge: repoItem.TotalJudge,
					TotalMulti: repoItem.TotalMulti,
					TotalRadio: repoItem.TotalRadio,
					TotalOper:  repoItem.TotalOper,
				})
			}
			if err := tx.Create(&examRepo).Error; err != nil {
				// 返回任何错误都会回滚事务
				return err
			}
		}
		return nil
	})
}

// SaveExam
// @function: SaveExam
// @description: 添加考试
// @param: info examReq.ExamFormnRequest
// @return:  err error
func (e *ExamService) SaveExam(info examReq.ExamFormnRequest) (err error) {
	var examData = examination.ElExam{
		Title:        info.Title,
		Content:      info.Content,
		OpenType:     info.OpenType,
		TotalScore:   info.TotalScore,
		TotalTime:    info.TotalTime,
		QualifyScore: info.QualifyScore,
		TimeLimit:    0,
		StartTime:    new(global.LocalTime),
		EndTime:      new(global.LocalTime),
	}

	if info.TimeLimit {
		examData.TimeLimit = 1
		if info.StartTime != "" && info.EndTime != "" {

			//loc, _ := time.LoadLocation("Local")
			//sTime, _ := time.ParseInLocation("2006-01-02 15:04:05", info.StartTime, loc)
			//eTime, _ := time.ParseInLocation("2006-01-02 15:04:05", info.EndTime, loc)

			sTime, _ := time.ParseInLocation("2006-01-02 15:04:05", info.StartTime, time.FixedZone("CST", 8*3600))
			eTime, _ := time.ParseInLocation("2006-01-02 15:04:05", info.EndTime, time.FixedZone("CST", 8*3600))
			fmt.Println(sTime)

			*examData.StartTime = global.LocalTime(sTime)
			*examData.EndTime = global.LocalTime(eTime)
		}
	}
	fmt.Println(examData)
	aa, _ := json.Marshal(examData)
	fmt.Println(string(aa))

	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		// 在事务中执行一些 db 操作（从这里开始，您应该使用 'tx' 而不是 'db'）
		if err := tx.Debug().Create(&examData).Error; err != nil {
			// 返回任何错误都会回滚事务
			return err
		}
		//部门
		if len(info.DepartIds) > 0 {
			var examDepData []examination.ElExamDepart
			for _, depIds := range info.DepartIds {
				examDepData = append(examDepData, examination.ElExamDepart{
					ExamId:   int(examData.ID),
					DepartId: depIds,
				})
			}
			if err := tx.Debug().Create(&examDepData).Error; err != nil {
				// 返回任何错误都会回滚事务
				return err
			}
		}
		//试卷题目详情
		if len(info.RepoList) > 0 {
			var examRepo []examination.ElExamRepo
			for _, repoItem := range info.RepoList {
				examRepo = append(examRepo, examination.ElExamRepo{
					ExamId:     int(examData.ID),
					RepoId:     repoItem.Id,
					JudgeCount: repoItem.JudgeCount,
					JudgeScore: repoItem.JudgeScore,
					MultiCount: repoItem.Multicount,
					MultiScore: repoItem.MultiScore,
					RadioCount: repoItem.RadioCount,
					RadioScore: repoItem.RadioScore,
					SaqCount:   repoItem.SaqCount,
					SaqScore:   repoItem.SagScore,
					TotalJudge: repoItem.TotalJudge,
					TotalMulti: repoItem.TotalMulti,
					TotalRadio: repoItem.TotalRadio,
					TotalOper:  repoItem.TotalOper,
				})
			}
			if err := tx.Create(&examRepo).Error; err != nil {
				// 返回任何错误都会回滚事务
				return err
			}

		}
		return nil
	})
}

// PaperResult
// @function: PaperResult
// @description: 考试详情
// @param: id int
// @return: list interface{}
func (e *ExamService) PaperResult(id int) (list interface{}, err error) {
	var data examination.ElPaper
	err = global.GVA_DB.Preload("QuList", "paper_id = ?", id).Preload("QuList.QuInfo").Preload("QuList.AnswerList", "paper_id = ?", id).Preload("QuList.AnswerList.AnswerInfo").Preload("UserInfo").First(&data, id).Error
	return data, err
}

// OnlineExam
// @function: OnlineExam
// @description: 获取考试列表
// @param: info examReq.ExamListRequest
// @return: list interface{}, total int64, err error
func (e *ExamService) OnlineExam(info examReq.ExamListRequest, userInfo examination.SysUser) (list interface{}, total int64, err error) {
	limit := info.Size
	offset := info.Size * (info.Current - 1)
	db := global.GVA_DB.Model(&examination.ElExam{}).Joins("left join el_exam_depart on el_exam_depart.exam_id = el_exam.id").Where("(el_exam_depart.depart_id = ? OR el_exam.open_type = 1)", userInfo.DepartId)
	//获取当前用户信息
	var examList []examination.ElExam
	if info.Params.Title != "" {
		db = db.Where("el_exam.title like ?", "%"+info.Params.Title+"%")
	}
	if info.Params.OpenType > 0 {
		db = db.Where("el_exam.open_type = ?", info.Params.OpenType)
	}
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Debug().Order("el_exam.id desc").Limit(limit).Offset(offset).Find(&examList).Error
	return examList, total, err
}

// GetQuListsByIds
// @function: GetQuListsByIds
// @description: 获取考题详情
// @param: u model.GcCompany
// @return: err error
func (e *ExamService) GetQuListsByIds(ids []int) (list []examination.ElQuInfo, err error) {
	var result []examination.ElQuInfo
	err = global.GVA_DB.Where("id in ?", ids).Preload("AnswerList").Order("qu_type,id").Find(&result).Error
	return result, err
}

// ExamDetail
// @function: ExamDetail
// @description: 考试详情
// @param: id int
// @return: list interface{}
func (e *ExamService) ExamDetail(id int) (list examination.ElExam, err error) {
	var data examination.ElExam
	err = global.GVA_DB.Debug().Preload("RepoList").Preload("DepList").First(&data, id).Error
	return data, err
}

// GetRandQuLists
// @function: GetRandQuLists
// @description: 获取随机考题
// @param: u model.GcCompany
// @return: err error
func (e *ExamService) GetRandQuLists(quType, limit, score int, allQuIds *[]int, quScore map[int]int, repoId int) (err error) {
	var result []int
	db := global.GVA_DB.Model(&examination.ElQuRepo{}).Order("RAND()").Where("qu_type = ? and repo_id = ?", quType, repoId).Limit(limit)
	if len(*allQuIds) > 0 {
		db = db.Where("qu_id not in ?", *allQuIds)
	}
	err = db.Debug().Pluck("qu_id", &result).Error
	if err != nil {
		return
	}
	*allQuIds = append(*allQuIds, result...)
	for _, quId := range result {
		quScore[quId] = score
	}
	return
}

// CreatePaper
// @function: CreatePaper
// @description: 考试
// @param: u model.GcCompany
// @return: err error
func (e *ExamService) CreatePaper(info examReq.CreatePaper, user examination.SysUser) (paerInfo examination.ElPaper, err error) {
	examInfo, err := e.ExamDetail(info.ExamId)
	if err != nil {
		return
	}
	abcTages := map[int]string{
		0: "A",
		1: "B",
		2: "C",
		3: "D",
		4: "E",
		5: "F",
		6: "G",
	}
	//计算截止时间
	limitTime := time.Now().Add(time.Duration(examInfo.TotalTime) * time.Minute)
	//保存paper
	paper := examination.ElPaper{
		UserId:       int(user.ID),
		DepartId:     user.DepartId,
		ExamId:       int(examInfo.ID),
		Title:        examInfo.Title,
		TotalTime:    examInfo.TotalTime,
		TotalScore:   examInfo.TotalScore,
		QualifyScore: examInfo.QualifyScore,
		LimitTime:    (*global.LocalTime)(unsafe.Pointer(&limitTime)),
	}

	if len(examInfo.RepoList) == 0 {
		err = errors.New("缺少题目")
		return
	}
	var allQuIds []int
	var quSocre = make(map[int]int)
	//选题
	for _, repoItem := range examInfo.RepoList {
		//单选
		if repoItem.RadioCount > 0 {
			err = e.GetRandQuLists(RadioType, repoItem.RadioCount, repoItem.RadioScore, &allQuIds, quSocre, repoItem.RepoId)
			if err != nil {
				return
			}
		}
		//多选
		if repoItem.MultiCount > 0 {
			err = e.GetRandQuLists(MutiType, repoItem.MultiCount, repoItem.MultiScore, &allQuIds, quSocre, repoItem.RepoId)
			if err != nil {
				return
			}
		}
		//判断
		if repoItem.JudgeCount > 0 {
			err = e.GetRandQuLists(JudgeType, repoItem.JudgeCount, repoItem.JudgeScore, &allQuIds, quSocre, repoItem.RepoId)
			if err != nil {
				return
			}
		}
		//实操题
		if repoItem.SaqCount > 0 {
			err = e.GetRandQuLists(OperType, repoItem.SaqCount, repoItem.SaqScore, &allQuIds, quSocre, repoItem.RepoId)
			if err != nil {
				return
			}
		}

	}

	quLists, err := e.GetQuListsByIds(allQuIds)
	if err != nil {
		return
	}
	err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		// 添加考试
		if err := tx.Create(&paper).Error; err != nil {
			// 返回任何错误都会回滚事务
			return err
		}
		var paperQulists []examination.ElPaperQu
		var paperQuAnswerLists []examination.ElPaperQuAnswer
		for quIndex, quItem := range quLists {
			paperQulists = append(paperQulists, examination.ElPaperQu{
				PaperId:     int(paper.ID),
				QuId:        int(quItem.ID),
				QuType:      quItem.QuType,
				Score:       0,
				ActualScore: quSocre[int(quItem.ID)],
				Sort:        quIndex,
			})
			if len(quItem.AnswerList) > 0 {
				//题目详情
				for ansIndex, ansItem := range quItem.AnswerList {
					var isIsRight int
					if ansItem.IsRight {
						isIsRight = 1
					}
					paperQuAnswerLists = append(paperQuAnswerLists, examination.ElPaperQuAnswer{
						PaperId:  int(paper.ID),
						AnswerId: int(ansItem.ID),
						QuId:     int(quItem.ID),
						IsRight:  isIsRight,
						Sort:     ansIndex,
						Abc:      abcTages[ansIndex],
					})
				}
			}

		}
		if len(paperQulists) > 0 {
			if err := tx.Create(&paperQulists).Error; err != nil {
				// 返回任何错误都会回滚事务
				return err
			}
		}
		if len(paperQuAnswerLists) > 0 {
			if err := tx.Create(&paperQuAnswerLists).Error; err != nil {
				// 返回任何错误都会回滚事务
				return err
			}
		}
		var userExam = examination.ElUserExam{
			ExamId:   paper.ExamId,
			UserId:   paper.UserId,
			PaperId:  int(paper.ID),
			TryCount: 1,
			MaxScore: 0,
		}
		if err := tx.Create(&userExam).Error; err != nil {
			return err
		}
		return nil
	})

	if err != nil {
		return
	}

	return paper, nil
}

// PaperDetail
// @function: PaperDetail
// @description:
// @param: id int
// @return: list interface{}
func (e *ExamService) PaperDetail(id int) (list interface{}, err error) {
	var data examination.ElPaper
	err = global.GVA_DB.Preload("RadioList", "qu_type = ?", RadioType).Preload("MultiList", "qu_type = ?", MutiType).Preload("JudgeList", "qu_type = ?", JudgeType).Preload("OperList", "qu_type = ?", OperType).First(&data, id).Error
	if err != nil {
		return
	}
	//计算考试剩余时间
	nowTimeUnix := time.Now().Unix()
	limitTimeUnix := time.Time(*data.LimitTime).Unix()
	var leftSeconds int64 = -1
	if limitTimeUnix > nowTimeUnix {
		leftSeconds = limitTimeUnix - nowTimeUnix
	}
	data.LeftSeconds = leftSeconds
	return data, err
}

// QuDetail
// @function: QuDetail
// @description:
// @param: id int
// @return: list interface{}
func (e *ExamService) QuDetail(paperId, quId int) (list examination.ElPaperQu, err error) {
	var data examination.ElPaperQu
	err = global.GVA_DB.Debug().Where("paper_id = ? and qu_id = ?", paperId, quId).Preload("AnswerList", "paper_id = ?", paperId).Preload("AnswerList.AnswerInfo").Preload("QuInfo").First(&data).Error
	return data, err
}

// FillAnswer
// @function: FillAnswer
// @description:
// @param: id int
// @return: list interface{}
func (e *ExamService) FillAnswer(info examReq.FillAnswerForm) (err error) {
	var isTrue = true
	quInfo, err := e.QuDetail(info.PaperId, info.QuId)
	if err != nil {
		return
	}
	for _, ansItem := range quInfo.AnswerList {
		//正确的不存在切片中
		if ansItem.IsRight == 1 && !e.IsInSLiceIds(int(ansItem.ID), info.Answers) {
			isTrue = false
			break
		}
	}
	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		var (
			isRight = 0
			score   = 0
		)
		if isTrue {
			isRight = 1
			score = quInfo.ActualScore
		}
		//更新paper
		if err := tx.Model(examination.ElPaperQu{}).Where("id = ?", quInfo.ID).Updates(map[string]interface{}{
			"answered": 1,
			"is_right": isRight,
			"score":    score,
		}).Error; err != nil {
			return err
		}
		//清除check选项
		if err := tx.Model(examination.ElPaperQuAnswer{}).Where("paper_id = ? and qu_id = ?", info.PaperId, info.QuId).Update("checked", 0).Error; err != nil {
			return err
		}
		//选中用户填写答案
		if err := tx.Model(examination.ElPaperQuAnswer{}).Where("id in ?", info.Answers).Update("checked", 1).Error; err != nil {
			return err
		}

		//Where("id in ?", info.Answers)
		return nil
	})
}

func (e *ExamService) IsInSLiceIds(id int, ids []int) bool {
	if len(ids) == 0 {
		return false
	}
	for _, idIitem := range ids {
		if idIitem == id {
			return true
		}
	}
	return false
}

// HandExam
// @function: HandExam
// @description:
// @param: id int
// @return: list interface{}
func (e *ExamService) HandExam(id int) (err error) {
	var paper examination.ElPaper
	err = global.GVA_DB.Preload("QuList").First(&paper, id).Error
	if err != nil {
		return
	}
	//考试使用时间，计算分钟
	useTimeSecond := time.Now().Unix() - time.Time(*paper.CreatedAt).Unix()
	useSecond := int(math.Ceil(float64(useTimeSecond) / float64(60)))
	if useSecond > paper.TotalTime {
		useSecond = paper.TotalTime
	}
	var userScore, objScore, sujScore int
	for _, item := range paper.QuList {
		userScore += item.Score
		if item.QuType == RadioType || item.QuType == MutiType || item.QuType == JudgeType {
			objScore += item.Score
		} else {
			sujScore += item.Score
		}
	}

	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {

		if err := tx.Model(&examination.ElPaper{}).Where("id = ?", id).Updates(map[string]interface{}{
			"user_time":  useSecond,
			"obj_score":  objScore,
			"subj_score": objScore,
			"user_score": userScore,
			"state":      2,
		}).Error; err != nil {
			return err
		}

		var userExamInfo examination.ElUserExam

		tx.Where("user_id = ? and exam_id = ? and paper_id = ?", paper.UserId, paper.ExamId, paper.ID).First(&userExamInfo)
		if userExamInfo.ID > 0 {
			if userScore > paper.QualifyScore {
				userExamInfo.Passed = 1
			}
			if err := tx.Model(&examination.ElUserExam{}).Where("id = ?", userExamInfo.ID).Updates(map[string]interface{}{
				"updated_at": time.Now(),
				"passed":     userExamInfo.Passed,
				"max_score":  userScore,
			}).Error; err != nil {
				return err
			}
		}
		return nil
	})

}

// GetUserExamInfo
// @function: GetUserExamInfo
// @description:
// @param: id int
// @return: list interface{}
func (e *ExamService) GetUserExamInfo(depId, userId int) (examId uint, err error) {
	var examInfo []examination.ElExam
	//参与的考试记录
	var examHistoryIds []int
	dbExamHistory := global.GVA_DB.Model(&examination.ElUserExam{})
	err = dbExamHistory.Where("user_id = ?", userId).Pluck("exam_id", &examHistoryIds).Error
	if err != nil {
		return 0, errors.New("查询错误，请待会儿重试")
	}
	dbExam := global.GVA_DB.Model(&examination.ElExam{})
	dbExam = dbExam.Select("el_exam.*").Joins("join el_exam_depart on el_exam_depart.exam_id = el_exam.id").Where("el_exam_depart.depart_id = ?", depId).Where("time_limit = ?", ExamTimeLimit).Order("created_at desc")
	if len(examHistoryIds) > 0 {
		dbExam = dbExam.Where("el_exam.id not in ?", examHistoryIds)
	}
	err = dbExam.Debug().Find(&examInfo).Error
	if err != nil {
		return 0, errors.New("查询错误，请待会儿重试")
	}
	if len(examInfo) == 0 {
		return 0, errors.New("暂无比赛信息")
	}
	nowTime := time.Now().Unix()
	for _, examItem := range examInfo {
		examStartTime := time.Time(*examItem.StartTime).Unix()
		examEndTime := time.Time(*examItem.EndTime).Unix()
		if nowTime >= examStartTime && nowTime < examEndTime {
			return examItem.ID, nil
		}
	}
	return 0, errors.New("暂无比赛信息")
}

// FillOperAnswer
// @function: FillOperAnswer
// @description:
// @param: id int
// @return: list interface{}
func (e *ExamService) FillOperAnswer(quId, paperId string, url, name string) (err error) {
	quIdInt, _ := strconv.Atoi(quId)
	paperIdInt, _ := strconv.Atoi(paperId)
	err = global.GVA_DB.Model(&examination.ElPaperQu{}).Where("paper_id = ? and qu_id = ?", paperIdInt, quIdInt).Updates(map[string]interface{}{
		"answered":  1,
		"answer":    url,
		"file_name": name,
	}).Error
	return err
}

func (e *ExamService) gengxin(url, name string) (err error) {

	err = global.GVA_DB.Model(&examination.ElPaperQu{}).Updates(map[string]interface{}{
		"answered":  1,
		"answer":    url,
		"file_name": name,
	}).Error
	return err
}

// GetOperFileById
// @function: GetOperFileById
// @description:
// @param: id int
// @return: list interface{}
func (e *ExamService) GetOperFileById(id int) (info examination.ElPaperQu, err error) {
	var paperQu examination.ElPaperQu
	err = global.GVA_DB.First(&paperQu, id).Error
	return paperQu, err
}

// Deletekaoshi
// @function: DeleteQu
// @description: 删除试题
func (service *ExamService) Deletekaoshi(ids request.IdsReq) (err error) {

	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {

		var elElExam examination.ElExam
		err = global.GVA_DB.Debug().Where("id in ?", ids.Ids).Delete(&elElExam).Error
		if err != nil {
			return err
		}

		var elExamDepart examination.ElExamDepart
		err = global.GVA_DB.Debug().Where("exam_id in ?", ids.Ids).Delete(&elExamDepart).Error
		if err != nil {
			return err
		}

		var elExamRepo examination.ElExamRepo
		err = global.GVA_DB.Debug().Where("exam_id in ?", ids.Ids).Delete(&elExamRepo).Error
		if err != nil {
			return err
		}

		return nil
	})

}
