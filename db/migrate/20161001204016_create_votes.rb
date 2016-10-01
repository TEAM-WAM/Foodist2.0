class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.boolean :up
      t.string :voteable_type, null: false
      t.integer :voteable_id, null: false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
