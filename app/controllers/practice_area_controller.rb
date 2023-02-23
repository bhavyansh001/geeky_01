class PracticeAreaController < ApplicationController
  before_action :random_nums
  before_action :operator
  before_action :instantiate_question, only: [:index, :create]
  def index
    @expression = (@num1 + @operator + @num2)
    @ans = eval("#{@expression}")
  end
  def create
    @question = Question.new(question_params)
    @question.question = @expression
    if @question.save
      render :index,
      notice: 'Value recorded'
    else
      render :index,
      notice: 'Not recorded'
    end
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
  def instantiate_question
    @question = Question.new
  end
  def question_params
    params.require(:question).permit(:solution)
  end
end
