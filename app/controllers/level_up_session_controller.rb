class LevelUpSessionController < ApplicationController
  before_action :authenticate_user!
  before_action :random_nums
  before_action :operator
  before_action :set_question, only: [:question, :create, :time_up]
  before_action :set_params, only: [:create]
  before_action :dashboard, only: [:time_up]

  def question
    @expression = (@num1 + @operator + @num2)
    @@is_correct = eval("#{@expression}")
  end
  def create
    if @question.save
      redirect_to :question
    else
      render :question, notice: 'Question could not be saved.'
    end
  end
  def time_up
    @corrects = @questions.where(is_correct: true).count
    @incorrects = @questions.where(is_correct: false).count
  end
  private
  def operator
    op_array = ['+', '-', '*', '/']
    @operator = op_array.sample
  end
  def random_nums
    @num1 = Random.rand(20).to_s
    @num2 = (Random.rand(10) + 1).to_s
  end
  def set_question
    @level_up_session = PracticeArea::LevelUpSession.last
    @question = @level_up_session.questions.new
  end
  def set_params
    @question.expression = params[:expression]
    @question.solution = params[:solution]
    @time = Time.now.sec - params[:time_taken].to_i
    @question.time_taken = @time < 0 ? @time + 60 : @time
    @question.is_correct = params[:solution].to_i == @@is_correct
  end
  def dashboard
    @questions = @level_up_session.questions.where.not(solution: nil)
  end
end