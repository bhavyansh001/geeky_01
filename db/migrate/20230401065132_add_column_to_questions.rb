class AddColumnToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :is_correct, :boolean, default: false
  end
end
