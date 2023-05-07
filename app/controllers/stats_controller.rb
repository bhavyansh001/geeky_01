class StatsController < ApplicationController
  before_action :authenticate_user!
  before_action :all_questions
  before_action :basic_questions
  before_action :advanced_questions
  def stats
    @avg_time_taken = current_user.avg_time_taken
    @best_time_taken = current_user.best_time_taken
  end
  private
  def all_questions
    @all_questions = PracticeArea::Question
    .where(user_id: current_user)
    @accuracy = current_user.accuracy
  end
  def basic_questions
    @addition_questions = @all_questions
    .where("expression LIKE ?", "%+%")
    @subtraction_questions = @all_questions
    .where("expression LIKE ?", "%-%")
  end
  def advanced_questions
    @multiplication_questions = @all_questions
    .where("expression LIKE ?", "%*%")
    @division_questions = @all_questions
    .where("expression LIKE ?", "%/%")
  end
end
