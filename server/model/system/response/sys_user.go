package response

import (
	"examination/server/model/examination"
	"examination/server/model/system"
)

type SysUserResponse struct {
	User system.SysUser `json:"user"`
}

type SysUserResponses struct {
	User examination.SysUser `json:"user"`
}

type LoginResponse struct {
	User      system.SysUser `json:"user"`
	Token     string         `json:"token"`
	ExpiresAt int64          `json:"expiresAt"`
}

type LoginResponses struct {
	User      examination.SysUser `json:"user"`
	Token     string              `json:"token"`
	ExpiresAt int64               `json:"expiresAt"`
}
