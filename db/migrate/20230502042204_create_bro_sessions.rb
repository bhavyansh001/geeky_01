class CreateBroSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :bro_sessions do |t|
      t.references :question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
