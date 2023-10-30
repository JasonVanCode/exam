package v1

import (
	"examination/server/api/v1/example"
	"examination/server/api/v1/system"
)

type ApiGroup struct {
	SystemApiGroup  system.ApiGroup
	ExampleApiGroup example.ApiGroup
}

var ApiGroupApp = new(ApiGroup)
