package examination

import (
	"examination/server/global"
)

// 考试人员记录
type ElUserExam struct {
	global.GVA_MODEL
	UserId   int  `gorm:"column:user_id" json:"userId"`     //用户ID
	ExamId   int  `gorm:"column:exam_id" json:"examId"`     //考试ID
	PaperId  int  `gorm:"column:paper_id" json:"paperId"`   //考试ID
	TryCount int  `gorm:"column:try_count" json:"tryCount"` //考试次数
	MaxScore int  `gorm:"column:max_score" json:"maxScore"` //最高分数
	Passed   int8 `gorm:"column:passed" json:"passed"`      //是否通过
}

func (ElUserExam) TableName() string {
	return "el_user_exam"
}

type RetElUserExam struct {
	ElUserExam
	RealName string `gorm:"column:real_name" json:"realName"`
}
