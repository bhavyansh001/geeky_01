class CreateQuestionsTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :questions_times do |t|
      t.references :question, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :stop_time

      t.timestamps
    end
  end
end
