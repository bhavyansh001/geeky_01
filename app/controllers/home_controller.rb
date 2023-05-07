class HomeController < ApplicationController
  def index
    # @time1 = Question.last.created_at.sec
    # @time2 = Question.last.created_at.sec - 20
    # @time = (@time2 - @time1).abs
  end

  def about
  end
end
