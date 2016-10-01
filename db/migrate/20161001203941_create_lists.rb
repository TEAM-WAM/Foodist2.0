class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :title, null: false, limit: 100
      t.string :listable_type, null: false
      t.integer :listable_id, null: false

      t.timestamps null: false
    end
  end
end
