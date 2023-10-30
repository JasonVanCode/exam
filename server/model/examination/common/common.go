package common

type PageInfo struct {
	Current int    `json:"current"`
	OrderBy string `json:"orderBy"`
	Size    int    `json:"size"`
}

type PageResult struct {
	Total    int64       `json:"total"`
	Page     int         `json:"pages"`
	PageSize int         `json:"pageSize"`
	Current  int         `json:"current"`
	Size     int         `json:"size"`
	Records  interface{} `json:"records"`
}
