class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false, limit: 100
      t.string :restaurant_url
      t.string :address, null: false, limit: 200
      t.string :locality, limit: 100
      t.string :city, null: false, limit: 100
      t.string :zipcode, limit: 10
      t.string :average_cost_for_two, limit: 10
      t.string :featured_img
      t.string :menu_url
      t.boolean :has_online_delivery
      t.string :cuisines
      t.string :restaurant_id

      t.timestamps null: false
    end
  end
end
