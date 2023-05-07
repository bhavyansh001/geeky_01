class CreateLevelUpSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :level_up_sessions do |t|
      t.timestamps
    end
  end
end
