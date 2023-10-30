package request

import (
	"examination/server/model/common/request"
	"examination/server/model/system"
)

type SysDictionaryDetailSearch struct {
	system.SysDictionaryDetail
	request.PageInfo
}
