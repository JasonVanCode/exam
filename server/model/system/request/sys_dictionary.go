package request

import (
	"examination/server/model/common/request"
	"examination/server/model/system"
)

type SysDictionarySearch struct {
	system.SysDictionary
	request.PageInfo
}
