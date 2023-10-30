package request

import (
	jwt "github.com/golang-jwt/jwt/v4"
	uuid "github.com/satori/go.uuid"
)

// Custom claims structure
type CustomClaims struct {
	BaseClaims
	BufferTime int64
	jwt.StandardClaims
}

type BaseClaims struct {
	UUID        uuid.UUID
	ID          uint
	Username    string
	NickName    string
	AuthorityId uint
}

type CustomClaimsKaoshi struct {
	BaseClaimsKaoshi
	BufferTime int64
	jwt.StandardClaims
}

type BaseClaimsKaoshi struct {
	ID       uint     `gorm:"column:id" json:"id"`
	Username string   `gorm:"column:userName" json:"userName"`
	RealName string   `gorm:"column:realName" json:"realName"`
	DepartId int      `gorm:"column:departId" json:"departId"`
	RoleIds  string   `gorm:"column:roleIds" json:"roleIds"`
	Roles    []string `gorm:"column:roles" json:"roles"`
	State    int      `gorm:"column:state" json:"state"`
}

type Token struct {
	Token string `json:"token"`
}
