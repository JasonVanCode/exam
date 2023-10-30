package initialize

import (
	_ "examination/server/source/example"
	_ "examination/server/source/system"
)

func init() {
	// do nothing,only import source package so that inits can be registered
}
