class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.text :bio, limit: 300
      t.string :zipcode, limit: 10
      t.date :birthday
      t.attachment :avatar
      t.string :phone_number, limit: 16
      t.string :gender, limit: 50
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
