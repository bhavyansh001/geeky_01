class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :solution
      t.string :avg_time
      t.string :best_time

      t.timestamps
    end
  end
end
