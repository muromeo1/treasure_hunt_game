class AddTreasureFoundToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :treasure_found, :boolean, default: false
    add_column :users, :nth_found, :integer
  end
end
