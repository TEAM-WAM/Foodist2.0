class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false, limit: 50
      t.text :description, null: false, limit: 300
      t.integer :creator_id, null: false

      t.timestamps null: false
    end
  end
end
