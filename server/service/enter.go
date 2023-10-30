package service

import (
	"examination/server/service/examination"
	"examination/server/service/example"
	"examination/server/service/system"
)

type ServiceGroup struct {
	SystemServiceGroup      system.ServiceGroup
	ExampleServiceGroup     example.ServiceGroup
	ExaminationServiceGroup examination.ServiceGroup
}

var ServiceGroupApp = new(ServiceGroup)
