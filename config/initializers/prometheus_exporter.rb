require 'prometheus_exporter/middleware'
require 'prometheus_exporter/instrumentation'

Rails.application.middleware.use PrometheusExporter::Middleware

PrometheusExporter::Instrumentation::Process.start(type: 'web')
