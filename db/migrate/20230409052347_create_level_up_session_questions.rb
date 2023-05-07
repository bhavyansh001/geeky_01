class CreateLevelUpSessionQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :level_up_session_questions do |t|
      t.references :level_up_session, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
