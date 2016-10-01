class CreateCustomValues < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_values do |t|
      t.string :field_value, null: false, limit: 100
      t.integer :custom_field_id, null: false
      t.string :customable_value_type, null: false
      t.integer :customable_value_id, null: false

      t.timestamps null: false
    end
  end
end
