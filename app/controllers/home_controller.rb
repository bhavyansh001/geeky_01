class HomeController < ApplicationController
  def index
    Prometheus::Counter.new(
      name: 'products_controller_index_requests_total',
      help: 'Total number of requests to the index action'
    ).increment
  end

  def about
  end
end
