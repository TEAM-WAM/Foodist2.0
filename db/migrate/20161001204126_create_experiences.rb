class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :list_experiences do |t|
      t.date :date_of_experience, null: false
      t.string :main_dish, limit: 100
      t.integer :price
      t.integer :party_size
      t.integer :time_seated
      t.integer :time_waiting
      t.text :notes, limit: 200
      t.integer :list_restaurant_id, null: false

      t.timestamps null: false
    end
  end
end
