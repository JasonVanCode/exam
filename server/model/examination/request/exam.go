package request

import "examination/server/model/examination/common"

type ExamListRequest struct {
	common.PageInfo
	Params ExamListRequestParam `json:"params"`
}

type ExamListRequestParam struct {
	StartTime string `json:"startTime"`
	EndTime   string `json:"endTime"`
	OpenType  int    `json:"openType"`
	Title     string `json:"title"`
}

// 考试保存form表单
type ExamFormnRequest struct {
	Id           int        `json:"id"`
	Content      string     `json:"content"`
	DepartIds    []int      `json:"departIds"`
	EndTime      string     `json:"endTime"`
	OpenType     int        `json:"openType"`
	QualifyScore int        `json:"qualifyScore"`
	StartTime    string     `json:"startTime"`
	TimeLimit    bool       `json:"timeLimit"`
	Title        string     `json:"title"`
	TotalScore   int        `json:"totalScore"`
	TotalTime    int        `json:"totalTime"`
	RepoList     []RepoList `json:"repoList"`
}

type RepoList struct {
	Id         int `json:"id"`
	JudgeCount int `json:"judgeCount"`
	JudgeScore int `json:"judgeScore"`
	Multicount int `json:"multicount"`
	MultiScore int `json:"multiScore"`
	RadioCount int `json:"radioCount"`
	RadioScore int `json:"radioScore"`
	SaqCount   int `json:"operCount"`
	SagScore   int `json:"operScore"`
	TotalJudge int `json:"totalJudge"`
	TotalMulti int `json:"totalMulti"`
	TotalRadio int `json:"totalRadio"`
	TotalOper  int `json:"totalOper"`
	RepoId     int `json:"repoId"`
}

type ExamDetail struct {
	Id int `json:"id"`
}

type ExamDetails struct {
	UserId int `json:"userId"`
	ExamId int `json:"examId"`
}

// 考试保存form表单
type CreatePaper struct {
	ExamId   int    `json:"examId"`
	Password string `json:"password"`
}

type PaperDetailForm struct {
	Id int `json:"id"`
}

type QuDetailForm struct {
	PaperId int `json:"paperId"`
	QuId    int `json:"quId"`
}

type FillAnswerForm struct {
	Answer  string `json:"answer"`
	Answers []int  `json:"answers"`
	PaperId int    `json:"paperId"`
	QuId    int    `json:"quId"`
}

type HandExamForm struct {
	Id int `json:"id"`
}

type PaperResult struct {
	Id int `json:"id"`
}

// 实操题数据上传
type PaperOperForm struct {
	PaperId int `json:"paperId"`
	QuId    int `json:"quId"`
}
