package examination

import "examination/server/global"

// 考试记录答案
type ElPaperQuAnswer struct {
	global.GVA_MODEL
	PaperId    int        `gorm:"column:paper_id" json:"paperId"`   //试卷ID
	AnswerId   int        `gorm:"column:answer_id" json:"answerId"` //回答项ID
	QuId       int        `gorm:"column:qu_id" json:"quId"`         //题目ID
	IsRight    int        `gorm:"column:is_right" json:"isRight"`   //是否正确项
	Checked    int        `gorm:"column:checked" json:"checked"`    //是否选中
	Sort       int        `gorm:"column:sort" json:"sort"`          //排序
	Abc        string     `gorm:"column:abc" json:"abc"`            //选项标签
	AnswerInfo ElQuAnswer `gorm:"foreignKey:AnswerId" json:"answerInfo"`
}

func (ElPaperQuAnswer) TableName() string {
	return "el_paper_qu_answer"
}
