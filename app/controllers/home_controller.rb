require 'prometheus/client'

class HomeController < ApplicationController
  @@home_controller_index_requests_total = nil
  def index
    unless @@home_controller_index_requests_total
      @@home_controller_index_requests_total = Prometheus::Client.registry.counter(:home_controller_index_requests_total, docstring: 'Total number of requests to the home controller index action')
    end

    # Increment the counter
    @@home_controller_index_requests_total.increment
  end

  def about
  end
end
