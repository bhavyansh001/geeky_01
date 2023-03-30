class AddColumnToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :level_up_session_id, :integer
    add_foreign_key :questions, :level_up_sessions, column: :level_up_session_id
  end
end
