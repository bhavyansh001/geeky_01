class AddFieldToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :guest, :boolean, default: false
  end
end
