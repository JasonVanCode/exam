package response

import "examination/server/model/examination"

type SearchExamUserResponse struct {
	examination.ElUserExam
	RealName string `json:"realName"`
}
