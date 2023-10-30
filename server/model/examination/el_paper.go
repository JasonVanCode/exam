package examination

import (
	"examination/server/global"
)

// 考试记录
type ElPaper struct {
	global.GVA_MODEL
	UserId       int               `gorm:"column:user_id" json:"userId"`             //用户ID
	DepartId     int               `gorm:"column:depart_id" json:"departId"`         //部门ID
	ExamId       int               `gorm:"column:exam_id" json:"examId"`             //规则ID
	Title        string            `gorm:"column:title" json:"title"`                //考试标题
	TotalTime    int               `gorm:"column:total_time" json:"totalTime"`       //考试时长
	UserTime     int               `gorm:"column:user_time" json:"userTime"`         //用户时长
	TotalScore   int               `gorm:"column:total_score" json:"totalScore"`     //试卷总分
	QualifyScore int               `gorm:"column:qualify_score" json:"qualifyScore"` //及格分
	ObjScore     int               `gorm:"column:obj_score" json:"objScore"`         //客观分
	SubjScore    int               `gorm:"column:subj_score" json:"subjScore"`       //主观分
	UserScore    int               `gorm:"column:user_score" json:"userScore"`       //用户得分
	HasSaq       int8              `gorm:"column:has_saq" json:"hasSaq"`             //是否包含简答题
	State        int               `gorm:"column:state" json:"state"`                //试卷状态
	LimitTime    *global.LocalTime `gorm:"column:limit_time" json:"limitTime"`       //截止时间
	JudgeList    []ElPaperQu       `gorm:"foreignKey:PaperId" json:"judgeList"`      //判断
	MultiList    []ElPaperQu       `gorm:"foreignKey:PaperId" json:"multiList"`      //多选
	RadioList    []ElPaperQu       `gorm:"foreignKey:PaperId" json:"radioList"`      //单选
	OperList     []ElPaperQu       `gorm:"foreignKey:PaperId" json:"operList"`       //单选
	QuList       []ElPaperQu       `gorm:"foreignKey:PaperId" json:"quList"`         //所有题目
	LeftSeconds  int64             `gorm:"-" json:"leftSeconds"`
	UserInfo     SysUser           `gorm:"foreignKey:UserId" json:"userInfo"`
}

func (ElPaper) TableName() string {
	return "el_paper"
}
