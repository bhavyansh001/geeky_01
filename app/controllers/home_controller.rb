class HomeController < ApplicationController
  def index
    @time1 = DateTime.now.sec
    @time2 = DateTime.now.sec + 20
    @time = (@time2 - @time1)
  end

  def about
  end
end
