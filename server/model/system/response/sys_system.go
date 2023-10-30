package response

import "examination/server/config"

type SysConfigResponse struct {
	Config config.Server `json:"config"`
}
