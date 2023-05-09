class DropGuestsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :guests
  end
end
