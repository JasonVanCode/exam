package response

import "examination/server/model/examination"

type DepartTreeRespnse struct {
	examination.SysDepart
	Children []DepartTreeRespnse `json:"children"`
}
