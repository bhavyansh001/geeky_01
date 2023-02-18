class PracticeAreaController < ApplicationController
  before_action :random_nums, only: [:index]
  def index
    
  end
  private
  def random_nums
    @num1 = (Random.rand(50) + 50).to_s
    @num2 = Random.rand(50).to_s
  end
end
