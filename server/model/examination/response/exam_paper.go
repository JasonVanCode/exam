package response

import "examination/server/global"

type PaperResponse struct {
	CreateTime     string            `json:"createTime"`
	DepartID       int               `json:"departId"`
	ExamID         int               `json:"examId"`
	HasSaq         int8              `json:"hasSaq"`
	ID             uint              `json:"id"`
	LimitTime      *global.LocalTime `json:"limitTime"`
	ObjScore       int               `json:"objScore"`
	QuList         []QuList          `json:"quList"`
	QualifyScore   int               `json:"qualifyScore"`
	State          int               `json:"state"`
	SubjScore      int               `json:"subjScore"`
	Title          string            `json:"title"`
	TotalScore     int               `json:"totalScore"`
	TotalTime      int               `json:"totalTime"`
	UpdatedAt      *global.LocalTime `json:"UpdatedAt"`
	UserID         int               `json:"userId"`
	UserScore      int               `json:"userScore"`
	UserTime       int               `json:"userTime"`
	UserIdDictText string            `json:"userId_dictText"`
}
type AnswerList struct {
	Abc      string `json:"abc"`
	AnswerID int    `json:"answerId"`
	Checked  int8   `json:"checked"`
	Content  string `json:"content"`
	ID       uint   `json:"id"`
	Image    string `json:"image"`
	IsRight  bool   `json:"isRight"`
	PaperID  int    `json:"paperId"`
	QuID     int    `json:"quId"`
	Sort     int    `json:"sort"`
}
type QuList struct {
	ActualScore int          `json:"actualScore"`
	Answer      string       `json:"answer"`
	AnswerList  []AnswerList `json:"answerList"`
	Answered    bool         `json:"answered"`
	Content     string       `json:"content"`
	ID          uint         `json:"id"`
	Image       string       `json:"image"`
	IsRight     int8         `json:"isRight"`
	PaperID     int          `json:"paperId"`
	QuID        int          `json:"quId"`
	QuType      int          `json:"quType"`
	Score       int          `json:"score"`
	Sort        int          `json:"sort"`
}
