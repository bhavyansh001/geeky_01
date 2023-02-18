class PracticeAreaController < ApplicationController
  before_action :random_nums
  before_action :operator
  def index
    @expression = (@num1 + @operator + @num2)
    @ans = eval("#{@expression}")
  end
  private
  def random_nums
    @num1 = Random.rand(20).to_s
    @num2 = Random.rand(10).to_s
  end
  def operator
    op_array = ['+', '-', '*', '/']
    @operator = op_array.sample
  end
end
