class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :liked_id, null:false
      t.string :liked_type, null:false

      t.timestamps
    end

    add_index :likes, [:liked_type, :liked_id]
  end
end
