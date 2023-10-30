package request

import "examination/server/model/examination/common"

type ExamUserListRequest struct {
	common.PageInfo
	Params ExamUserListRequestParam `json:"params"`
}

type ExamUserListRequestParam struct {
	RealName string `json:"realName"`
}
