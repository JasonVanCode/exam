package examination

import (
	"examination/server/global"
)

// 考试主表
type ElExam struct {
	global.GVA_MODEL
	Title        string            `gorm:"column:title" json:"title"`                //考试名称
	Content      string            `gorm:"column:content" json:"content"`            //考试描述
	OpenType     int               `gorm:"column:open_type" json:"openType"`         //1公开2部门3定员
	State        int               `gorm:"column:state" json:"state"`                //考试状态
	TimeLimit    int8              `gorm:"column:time_limit" json:"timeLimit"`       //是否限时
	StartTime    *global.LocalTime `gorm:"column:start_time" json:"startTime"`       //开始时间
	EndTime      *global.LocalTime `gorm:"column:end_time" json:"endTime"`           //结束时间
	TotalScore   int               `gorm:"column:total_score" json:"totalScore"`     //总分数
	TotalTime    int               `gorm:"column:total_time" json:"totalTime"`       //总时长（分钟）
	QualifyScore int               `gorm:"column:qualify_score" json:"qualifyScore"` //及格分数
	RepoList     []ElExamRepo      `gorm:"foreignKey:ExamId" json:"repoList"`
	DepList      []ElExamDepart    `gorm:"foreignKey:ExamId" json:"depList"`
}

func (ElExam) TableName() string {
	return "el_exam"
}

// 考试题库
type ElExamRepo struct {
	global.GVA_MODEL
	ExamId     int `gorm:"column:exam_id" json:"examId"`         //考试ID
	RepoId     int `gorm:"column:repo_id" json:"repoId"`         //题库ID
	RadioCount int `gorm:"column:radio_count" json:"radioCount"` //单选题数量
	RadioScore int `gorm:"column:radio_score" json:"radioScore"` //单选题分数
	MultiCount int `gorm:"column:multi_count" json:"multiCount"` //多选题数量
	MultiScore int `gorm:"column:multi_score" json:"multiScore"` //多选题分数
	JudgeCount int `gorm:"column:judge_count" json:"judgeCount"` //判断题数量
	JudgeScore int `gorm:"column:judge_score" json:"judgeScore"` //判断题分数
	SaqCount   int `gorm:"column:saq_count" json:"operCount"`    //简答题数量
	SaqScore   int `gorm:"column:saq_score" json:"operScore"`    //简答题分数
	TotalJudge int `gorm:"column:total_judge" json:"totalJudge"`
	TotalMulti int `gorm:"column:total_multi" json:"totalMulti"`
	TotalRadio int `gorm:"column:total_radio" json:"totalRadio"`
	TotalOper  int `gorm:"column:total_oper" json:"totalOper"`
}

func (ElExamRepo) TableName() string {
	return "el_exam_repo"
}

// 考试部门
type ElExamDepart struct {
	global.GVA_MODEL
	ExamId   int `gorm:"column:exam_id" json:"examId"`     //考试ID
	DepartId int `gorm:"column:depart_id" json:"departId"` //部门ID
}

func (ElExamDepart) TableName() string {
	return "el_exam_depart"
}
