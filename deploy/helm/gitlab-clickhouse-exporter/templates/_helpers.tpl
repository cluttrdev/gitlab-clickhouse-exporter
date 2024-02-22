{{/*
Expand the name of the chart.
*/}}
{{- define "gitlab-exporter-clickhouse-recorder.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "gitlab-exporter-clickhouse-recorder.fullname" -}}
{{- if contains .Chart.Name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "gitlab-exporter-clickhouse-recorder.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "gitlab-exporter-clickhouse-recorder.labels" -}}
helm.sh/chart: {{ include "gitlab-exporter-clickhouse-recorder.chart" . }}
{{ include "gitlab-exporter-clickhouse-recorder.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "gitlab-exporter-clickhouse-recorder.selectorLabels" -}}
app.kubernetes.io/name: {{ include "gitlab-exporter-clickhouse-recorder.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "gitlab-exporter-clickhouse-recorder.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "gitlab-exporter-clickhouse-recorder.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
