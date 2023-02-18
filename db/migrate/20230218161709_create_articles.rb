class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
    add_index :articles, :user_id
  end
end
