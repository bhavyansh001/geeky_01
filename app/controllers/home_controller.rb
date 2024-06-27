require 'prometheus/client'

class HomeController < ApplicationController
  def index
    @counter = Prometheus::Client.registry.counter('home_controller_index_requests_total', 'Total number of requests to the home controller index action')
    @counter.increment
  end

  def about
  end
end
