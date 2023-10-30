package examination

import (
	"examination/server/global"
	"examination/server/model/common/request"
	"examination/server/model/examination"
	examReq "examination/server/model/examination/request"
	"gorm.io/gorm"
)

type RepoService struct{}

// GetRepoList
// @function: GetCompanyList
// @description: 企业列表分野
// @param: u model.GcCompany
// @return: list huanbao.GcCompany,total, err error
func (service *RepoService) GetRepoList(info request.PageInfos) (list interface{}, total int64, err error) {
	limit := info.Size
	offset := info.Size * (info.Current - 1)
	db := global.GVA_DB.Model(&examination.ElQuInfo{})
	if info.Params.QuType != 0 {
		db = db.Where("qu_type = ? ", info.Params.QuType)
	}
	if info.Params.Content != "" {
		db = db.Where("code like ? ", "%"+info.Params.Content+"%")
	}
	var elQuInfoList []examination.ElQuInfo
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Order("id desc").Find(&elQuInfoList).Error

	return elQuInfoList, total, err
}

// GetDetail
// @function: GetCompanyList
// @description: 企业列表分页
// @param: u model.GcCompany
// @return: list huanbao.GcCompany,total, err error
func (service *RepoService) GetDetail(id int) (data examination.RetElQuInfo, err error) {
	var elQuInfoDetail examination.RetElQuInfo
	err = global.GVA_DB.Debug().Preload("AnswerList").Where("id = ?", id).First(&elQuInfoDetail).Error
	if err != nil {
		return data, nil
	}

	return elQuInfoDetail, err
}

// UpdRepo
// @function: UpdRepo
// @description: 修改题库
// SaveRepo
// @function: SaveRepo
// @description: 添加题库
// @param: u model.GcCompany
// @return: list huanbao.GcCompany,total, err error
func (service *RepoService) UpdRepo(info examReq.SetRepoRequest) (err error) {
	var repo = examination.ElRepo{
		Title:  info.Title,
		Remark: info.Remark,
	}
	var quRepoLists []examination.ElQuRepo
	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		// 在事务中执行一些 db 操作（从这里开始，您应该使用 'tx' 而不是 'db'）
		if err := tx.Model(&examination.ElRepo{}).Where("id = ?", info.Id).Updates(&repo).Error; err != nil {
			return err
		}
		//删除之前题库对应的题目数据
		if err := tx.Where("repo_id = ?", info.Id).Delete(&examination.ElQuRepo{}).Error; err != nil {
			return err
		}
		for _, vOne := range info.RepoList {
			for _, vTwo := range vOne.QuLists {
				quRepoLists = append(quRepoLists, examination.ElQuRepo{
					QuId:   vTwo.Id,
					RepoId: info.Id,
					QuType: vOne.QuType,
					Sort:   0,
				})
			}
		}
		if err := tx.Create(&quRepoLists).Error; err != nil {
			return err
		}
		return nil
	})
}

// SaveRepo
// @function: GetCompanyList
// @description: 企业列表分页
// SaveRepo
// @function: SaveRepo
// @description: 添加题库
// @param: u model.GcCompany
// @return: list huanbao.GcCompany,total, err error
func (service *RepoService) SaveRepo(info examReq.SetRepoRequest) (err error) {
	var repo = examination.ElRepo{
		Title:  info.Title,
		Remark: info.Remark,
	}
	var quRepoLists []examination.ElQuRepo
	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		// 在事务中执行一些 db 操作（从这里开始，您应该使用 'tx' 而不是 'db'）
		if err := tx.Create(&repo).Error; err != nil {
			// 返回任何错误都会回滚事务
			return err
		}
		for _, vOne := range info.RepoList {
			for _, vTwo := range vOne.QuLists {
				quRepoLists = append(quRepoLists, examination.ElQuRepo{
					QuId:   vTwo.Id,
					RepoId: int(repo.ID),
					QuType: vOne.QuType,
					Sort:   0,
				})
			}
		}
		if err := tx.Create(&quRepoLists).Error; err != nil {
			return err
		}
		return nil
	})
}

// AddQuList
// @function: GetCompanyList
// @description: 添加试题
func (service *RepoService) AddQuList(elQuInfo examination.ElQuInfo) (err error) {

	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		var saveData = examination.ElQuInfo{
			Analysis: elQuInfo.Analysis,
			Content:  elQuInfo.Content,
			Code:     elQuInfo.Code,
			Image:    elQuInfo.Image,
			Scimage:  elQuInfo.Scimage,
			Level:    elQuInfo.Level,
			QuType:   elQuInfo.QuType,
			Remark:   elQuInfo.Remark,
		}
		if err := tx.Debug().Create(&saveData).Error; err != nil {
			return err
		}
		if elQuInfo.QuType != 4 {
			var savesData []examination.ElQuAnswer
			for _, item := range elQuInfo.AnswerList {
				savesData = append(savesData, examination.ElQuAnswer{
					QuId:     saveData.ID,
					IsRight:  item.IsRight,
					Image:    item.Image,
					Content:  item.Content,
					Analysis: item.Analysis,
				})
			}
			if err := tx.Debug().Create(&savesData).Error; err != nil {
				return err
			}
		}

		return nil
	})
}

// SaveQuList
// @function: SaveQuList
// @description: 修改试题
func (service *RepoService) SaveQuList(elQuInfo examination.ElQuInfo) (err error) {

	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {

		if err := tx.Debug().Model(&examination.ElQuInfo{}).
			Select("qu_type", "level", "content", "remark", "analysis", "code", "scimage", "image").
			Where("id = ? ", elQuInfo.ID).
			Updates(map[string]interface{}{
				"code":     elQuInfo.Code,
				"qu_type":  elQuInfo.QuType,
				"scimage":  elQuInfo.Scimage,
				"level":    elQuInfo.Level,
				"content":  elQuInfo.Content,
				"remark":   elQuInfo.Remark,
				"analysis": elQuInfo.Analysis,
				"image":    elQuInfo.Image,
			}).
			Error; err != nil {
			return err
		}
		if elQuInfo.QuType != 4 {
			var elQuAnswer examination.ElQuAnswer

			err = tx.Where("qu_id = ?", elQuInfo.ID).Delete(&elQuAnswer).Error

			var savesData []examination.ElQuAnswer
			for _, item := range elQuInfo.AnswerList {
				savesData = append(savesData, examination.ElQuAnswer{
					QuId:     elQuInfo.ID,
					IsRight:  item.IsRight,
					Image:    item.Image,
					Content:  item.Content,
					Analysis: item.Analysis,
				})

			}
			if err := tx.Debug().Create(&savesData).Error; err != nil {
				return err
			}

		}

		return nil
	})
}

// DeleteQu
// @function: DeleteQu
// @description: 删除试题
func (service *RepoService) DeleteQu(ids request.IdsReq) (err error) {

	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {

		var elQuInfo examination.ElQuInfo
		err = global.GVA_DB.Find(&elQuInfo, "id in ?", ids.Ids).Delete(&elQuInfo).Error
		if err != nil {
			return err
		}

		var elQuAnswer examination.ElQuAnswer
		err = global.GVA_DB.Find(&elQuAnswer, "qu_id in ?", ids.Ids).Delete(&elQuAnswer).Error
		if err != nil {
			return err
		}

		return nil
	})

}

// RepoDetail
// @function: RepoDetail
// @description: 题库详情
// SaveRepo
// @function: SaveRepo
// @description: 添加题库
// @param: u model.GcCompany
// @return: list huanbao.GcCompany,total, err error
func (service *RepoService) RepoDetail(info examReq.RepoDetailForm) (list examReq.RepoDetailRet, err error) {
	var result examReq.RepoDetailRet
	var repoInfo examination.ElRepo
	err = global.GVA_DB.Preload("RadioQuList", "qu_type = ?", RadioType).Preload("MultiQuList", "qu_type = ?", MutiType).Preload("JudgeQuList", "qu_type = ?", JudgeType).Preload("OperQuList", "qu_type = ?", OperType).First(&repoInfo, info.Id).Error
	if err != nil {
		return
	}
	result.Id = int(repoInfo.ID)
	result.Title = repoInfo.Title
	result.Remark = repoInfo.Remark
	//处理数据
	if len(repoInfo.RadioQuList) > 0 {
		var radioDetail = examReq.RepoDetailQuLists{
			QuType:   RadioType,
			QuAllNum: len(repoInfo.RadioQuList),
		}
		for _, item := range repoInfo.RadioQuList {
			radioDetail.QuLists = append(radioDetail.QuLists, struct {
				Id int `json:"id"`
			}{Id: item.QuId})
		}
		result.RepoQuLists = append(result.RepoQuLists, radioDetail)
	}

	if len(repoInfo.MultiQuList) > 0 {
		var mutiDetail = examReq.RepoDetailQuLists{
			QuType:   MutiType,
			QuAllNum: len(repoInfo.MultiQuList),
		}
		for _, item := range repoInfo.MultiQuList {
			mutiDetail.QuLists = append(mutiDetail.QuLists, struct {
				Id int `json:"id"`
			}{Id: item.QuId})
		}
		result.RepoQuLists = append(result.RepoQuLists, mutiDetail)

	}

	if len(repoInfo.JudgeQuList) > 0 {
		var judgeDetail = examReq.RepoDetailQuLists{
			QuType:   JudgeType,
			QuAllNum: len(repoInfo.JudgeQuList),
		}
		for _, item := range repoInfo.JudgeQuList {
			judgeDetail.QuLists = append(judgeDetail.QuLists, struct {
				Id int `json:"id"`
			}{Id: item.QuId})
		}
		result.RepoQuLists = append(result.RepoQuLists, judgeDetail)

	}

	if len(repoInfo.OperQuList) > 0 {
		var operDetail = examReq.RepoDetailQuLists{
			QuType:   OperType,
			QuAllNum: len(repoInfo.OperQuList),
		}
		for _, item := range repoInfo.OperQuList {
			operDetail.QuLists = append(operDetail.QuLists, struct {
				Id int `json:"id"`
			}{Id: item.QuId})
		}
		result.RepoQuLists = append(result.RepoQuLists, operDetail)
	}

	return result, nil
}

// DeleteRepo
// @function: DeleteRepo
// @description: 删除题库
func (service *RepoService) DeleteRepo(ids []int) (err error) {
	return global.GVA_DB.Where("id in ?", ids).Delete(&examination.ElRepo{}).Error
}
