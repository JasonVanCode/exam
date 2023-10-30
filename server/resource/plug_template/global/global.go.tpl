package global

{{- if .HasGlobal }}

import "examination/server/plugin/{{ .Snake}}/config"

var GlobalConfig = new(config.{{ .PlugName}})
{{ end -}}