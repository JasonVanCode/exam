package response

import "examination/server/global"

type RepoResponse struct {
	Id         uint              `json:"id"`
	Code       string            `json:"code"`
	JudgeCount int               `json:"judgeCount"`
	MultiCount int               `json:"multiCount"`
	RadioCount int               `json:"radioCount"`
	OperCount  int               `json:"operCount"`
	Remark     string            `json:"remark"`
	Title      string            `json:"title"`
	CreateTime *global.LocalTime `json:"createTime"`
	UpdateTime *global.LocalTime `json:"updateTime"`
}
