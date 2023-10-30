package request

// PageInfo Paging common input parameter structure
type PageInfo struct {
	Page     int    `json:"page" form:"page"`         // 页码
	PageSize int    `json:"pageSize" form:"pageSize"` // 每页大小
	Keyword  string `json:"keyword" form:"keyword"`   //关键字
}

// PageInfo Paging common input parameter structure
type PageInfos struct {
	Current int `json:"current" form:"current"` // 页码
	Size    int `json:"size" form:"size"`       // 每页大小
	Params  Params
}

// Params Paging common input parameter structure
type Params struct {
	Content string `json:"content" form:"content"` // 页码
	QuType  int    `json:"quType" form:"quType"`   // 每页大小
}

// GetById Find by id structure
type GetById struct {
	ID int `json:"id" form:"id"` // 主键ID
}

func (r *GetById) Uint() uint {
	return uint(r.ID)
}

type IdsReq struct {
	Ids []int `json:"ids" form:"ids"`
}

type IdsReqState struct {
	Ids   []int `json:"ids" form:"ids"`     // 主键ID集合
	State int   `json:"state" form:"state"` //状态
}

// GetAuthorityId Get role by id structure
type GetAuthorityId struct {
	AuthorityId uint `json:"authorityId" form:"authorityId"` // 角色ID
}

// SortId Paging common input parameter structure
type SortId struct {
	Sort int `json:"sort" form:"sort"` // 页码
	Id   int `json:"id" form:"id"`     // 每页大小
}

type Empty struct{}
