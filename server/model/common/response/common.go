package response

import "examination/server/model/examination"

type PageResult struct {
	List     interface{} `json:"list"`
	Total    int64       `json:"total"`
	Page     int         `json:"page"`
	PageSize int         `json:"pageSize"`
}

type PageResults struct {
	Records     interface{} `json:"records"`
	Pages       int         `json:"pages"`
	HitCount    bool        `json:"hitCount"`
	Current     int         `json:"current"`
	SearchCount bool        `json:"searchCount"`
	Size        int         `json:"size"`
	Total       int64       `json:"total"`
}

type QuDetail struct {
	AnswerList examination.ElQuAnswer `json:"answerList"`
	Analysis   int                    `json:"analysis"`
	examination.ElQuInfo
}

type RolePageResult struct {
	HitCount    bool        `json:"hitCount"`
	SearchCount bool        `json:"searchCount"`
	Total       int64       `json:"total"`
	Pages       int         `json:"pages"`
	Current     int         `json:"current"`
	Size        int         `json:"size"`
	Records     interface{} `json:"records"`
}
