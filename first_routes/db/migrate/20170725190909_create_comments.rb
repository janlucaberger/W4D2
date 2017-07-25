class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :description, null: false
      t.integer :commenter_id, null: false
      t.integer :artwork_id, null: false
      
      t.timestamps
    end
  end
end
