require 'prometheus/client'

class HomeController < ApplicationController
  def index
    @home_controller_index_requests_total = Prometheus::Client.registry.counter(:home_controller_index_requests_total, docstring: 'Total number of requests to the home controller index action')
    @home_controller_index_requests_total.increment
  end

  def about
  end
end
