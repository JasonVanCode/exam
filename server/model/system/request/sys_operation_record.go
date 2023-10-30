package request

import (
	"examination/server/model/common/request"
	"examination/server/model/system"
)

type SysOperationRecordSearch struct {
	system.SysOperationRecord
	request.PageInfo
}
