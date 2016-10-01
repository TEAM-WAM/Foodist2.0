class CreateCustomFields < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_fields do |t|
      t.string :field_name, null: false, limit: 100
      t.string :customable_field_type, null: false
      t.integer :customable_field_id, null: false

      t.timestamps null: false
    end
  end
end
