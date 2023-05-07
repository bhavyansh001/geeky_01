class StatsController < ApplicationController
  def stats
    @all_questions = PracticeArea::Question.where(user_id: current_user)
    @addition_questions = @all_questions.where("expression LIKE ?", "%+%")
    @subtraction_questions = @all_questions.where("expression LIKE ?", "%-%")
    @multiplication_questions = @all_questions.where("expression LIKE ?", "%*%")
    @division_questions = @all_questions.where("expression LIKE ?", "%/%")

    @avg_time_taken = current_user.avg_time_taken
    @best_time_taken = current_user.best_time_taken
end
end
