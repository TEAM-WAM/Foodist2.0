class CreateAddedPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :list_restaurants do |t|
      t.string :name, null: false, limit: 100
      t.string :cuisine, limit: 100
      t.string :fav_dish, limit: 100
      t.string :restaurant_type, limit: 100
      t.string :location, limit: 100
      t.boolean :tried, default: false
      t.integer :restaurant_id, null: false
      t.integer :list_id, null: false

      t.timestamps null: false
    end
  end
end
