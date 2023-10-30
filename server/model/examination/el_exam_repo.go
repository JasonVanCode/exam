package examination

import (
	"examination/server/global"
)

// 题库信息
type ElRepo struct {
	global.GVA_MODEL
	Code        string     `gorm:"column:code" json:"code"`     //题库编号
	Title       string     `gorm:"column:title" json:"title"`   //题库名称
	Remark      string     `gorm:"column:remark" json:"remark"` //题库备注
	ExamRepo    ElExamRepo `json:"examRepo" gorm:"foreignKey:RepoId"`
	ElQuRepo    []ElQuRepo `json:"quRepo" gorm:"foreignKey:RepoId"`
	RadioQuList []ElQuRepo `json:"RadioQuList" gorm:"foreignKey:RepoId"` //单选题
	MultiQuList []ElQuRepo `json:"multiQuList" gorm:"foreignKey:RepoId"` //多选题
	JudgeQuList []ElQuRepo `json:"judgeQuList" gorm:"foreignKey:RepoId"` //判断题
	OperQuList  []ElQuRepo `json:"operQuList" gorm:"foreignKey:RepoId"`  //实操题
}

func (ElRepo) TableName() string {
	return "el_repo"
}

// 题库与题关联表
// 试题题库关联
type ElQuRepo struct {
	global.GVA_MODEL
	QuId   int `gorm:"column:qu_id" json:"qu_id"`     //试题
	RepoId int `gorm:"column:repo_id" json:"repo_id"` //归属题库
	QuType int `gorm:"column:qu_type" json:"qu_type"` //题目类型
	Sort   int `gorm:"column:sort" json:"sort"`       //排序
}

func (ElQuRepo) TableName() string {
	return "el_qu_repo"
}
