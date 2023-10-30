package examination

import (
	"examination/server/global"
)

type ElQuInfo struct {
	global.GVA_MODEL
	QuType     int          `json:"quType" gorm:"quType"`     // 题目类型
	Code       string       `json:"code" gorm:"code"`         // 题目类型
	Level      int          `json:"level" gorm:"level"`       // 1普通,2较难
	Image      string       `json:"image" gorm:"image"`       // 题目图片
	Scimage    string       `json:"scimage" gorm:"scimage"`   // 实操图片
	Content    string       `json:"content" gorm:"content"`   // 题目内容
	Remark     string       `json:"remark" gorm:"remark"`     // 题目备注
	Analysis   string       `json:"analysis" gorm:"analysis"` // 整题解析
	AnswerList []ElQuAnswer `gorm:"foreignKey:QuId" json:"answerList"`
}

func (ElQuInfo) TableName() string {
	return "el_qu"
}

type RetElQuInfo struct {
	ID         uint         `gorm:"primarykey" json:"id"`     // 主键ID
	QuType     int32        `json:"quType" gorm:"quType"`     // 题目类型
	Code       string       `json:"code" gorm:"code"`         // 题目类型
	Level      int32        `json:"level" gorm:"level"`       // 1普通,2较难
	Image      string       `json:"image" gorm:"image"`       // 题目图片
	Scimage    string       `json:"scimage" gorm:"scimage"`   // 实操图片
	Content    string       `json:"content" gorm:"content"`   // 题目内容
	Remark     string       `json:"remark" gorm:"remark"`     // 题目备注
	Analysis   string       `json:"analysis" gorm:"analysis"` // 整题解析
	AnswerList []ElQuAnswer `gorm:"foreignKey:QuId" json:"answerList"`
}

func (RetElQuInfo) TableName() string {
	return "el_qu"
}
