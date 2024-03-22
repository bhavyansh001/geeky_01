class DropGuestsTable < ActiveRecord::Migration[7.1]
 def up
    drop_table :guests if table_exists?(:guests)
 end

 def down
    raise ActiveRecord::IrreversibleMigration
  end
end
