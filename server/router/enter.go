package router

import (
	"examination/server/router/examination"
	"examination/server/router/example"
	"examination/server/router/system"
)

type RouterGroup struct {
	System      system.RouterGroup
	Example     example.RouterGroup
	Examination examination.RouterGroup
}

var RouterGroupApp = new(RouterGroup)
