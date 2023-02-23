class AddDefaultToQuestion < ActiveRecord::Migration[7.0]
  def change
    change_column_default :questions, :avg_time, "0"
    change_column_default :questions, :best_time, "0"
  end
end
