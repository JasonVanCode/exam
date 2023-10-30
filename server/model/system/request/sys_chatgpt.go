package request

import (
	"examination/server/model/common/request"
	"examination/server/model/system"
)

type ChatGptRequest struct {
	system.ChatGpt
	request.PageInfo
}
