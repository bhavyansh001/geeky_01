require 'prometheus/client'

class HomeController < ApplicationController

  counter = Prometheus::Client.registry.counter('home_controller_index_requests_total', 'Total number of requests to the home controller index action')
  def index
    counter.increment
  end

  def about
  end
end
