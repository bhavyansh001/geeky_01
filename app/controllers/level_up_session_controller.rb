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
    @level_up_session_question = LevelUpSessionQuestion.new(
      level_up_session: @level_up_session,
      question: @question
      )
    if @question.save
      @level_up_session_question.save
      redirect_to :question
    else
      render :question, notice: 'Question could not be saved.'
    end
  end
  def time_up
    @corrects = PracticeArea::Question
    .where(is_correct: true, id: @questions.map(&:id))
    @incorrects = PracticeArea::Question
    .where(is_correct: false, id: @questions.map(&:id))
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
    @level_up_session = current_user.level_up_sessions.last
    @question = PracticeArea::Question.new(user_id: current_user.id)
  end
  def set_params
    @question.expression = params[:expression]
    @question.solution = params[:solution]
    @time = Time.now.sec - params[:time_taken].to_i
    @question.time_taken = @time < 0 ? @time + 60 : @time
    @question.is_correct = params[:solution].to_i == @@is_correct
  end
  def dashboard
    question_ids = PracticeArea::LevelUpSessionQuestion.where(
      level_up_session_id: @level_up_session.id).pluck(:question_id)
    @questions = PracticeArea::Question.find(question_ids)
  end
end