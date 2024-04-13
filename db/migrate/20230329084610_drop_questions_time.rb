class DropQuestionsTime < ActiveRecord::Migration[7.0]
  def change
    drop_table :questions_times if table_exists?(:questions_times)
  end
end
