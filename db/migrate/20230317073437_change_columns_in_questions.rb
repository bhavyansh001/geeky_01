class ChangeColumnsInQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :time_taken, :integer
    remove_column :questions, :avg_time
    remove_column :questions, :best_time
  end
end
