package examination

import "examination/server/global"

// 考试记录考题
type ElPaperQu struct {
	global.GVA_MODEL
	PaperId     int               `gorm:"column:paper_id" json:"paperId"`                    //试卷ID
	QuId        int               `gorm:"column:qu_id" json:"quId"`                          //题目ID
	QuType      int               `gorm:"column:qu_type" json:"quType"`                      //题目类型
	Answered    int8              `gorm:"column:answered" json:"answered"`                   //是否已答
	Answer      string            `gorm:"column:answer" json:"answer"`                       //主观答案
	FileName    string            `gorm:"column:file_name" json:"fileName"`                  //文件名
	Sort        int               `gorm:"column:sort" json:"sort"`                           //问题排序
	Score       int               `gorm:"column:score" json:"score"`                         //单题分分值
	ActualScore int               `gorm:"column:actual_score" json:"actualScore"`            //实际得分(主观题)
	IsRight     int8              `gorm:"column:is_right" json:"isRight"`                    //是否答对
	AnswerList  []ElPaperQuAnswer `gorm:"foreignKey:QuId;references:QuId" json:"answerList"` //指定
	QuInfo      ElQuInfo          `gorm:"foreignKey:QuId" json:"quInfo"`
}

func (ElPaperQu) TableName() string {
	return "el_paper_qu"
}
