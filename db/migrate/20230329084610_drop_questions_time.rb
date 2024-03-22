class DropQuestionsTime < ActiveRecord::Migration[7.1]
 def up
    drop_table :questions_times if table_exists?(:questions_times)
 end

 def down
    raise ActiveRecord::IrreversibleMigration
  end
end
