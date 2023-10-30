package request

import "examination/server/model/examination/common"

type PaperRecordRequest struct {
	common.PageInfo
	Params PaperRecordRequestParam `json:"params"`
}

type PaperRecordRequestParam struct {
	ExamId int `json:"examId"`
	UserId int `json:"userId"`
	ID     int `json:"id"`
}
