class CreateLocationHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :location_histories do |t|
      t.references :user, index: true, foreign_key: true
      t.text :current_location, array: true, default: []
      t.text :destination, array: true, default: []
      t.integer :radius, null: false

      t.timestamps
    end
  end
end
