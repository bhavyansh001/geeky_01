class MetricsController < ApplicationController
    def index
      render plain: Prometheus::Client.registry.to_s
    end
  end
