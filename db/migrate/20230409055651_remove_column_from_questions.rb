class RemoveColumnFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :level_up_session_id, :integer
  end
end
