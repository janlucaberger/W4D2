class ChangeLikesColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :likes, :liked_id, :likeable_id
    rename_column :likes, :liked_type, :likeable_type
  end
end
