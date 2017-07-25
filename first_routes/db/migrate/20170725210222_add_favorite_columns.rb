class AddFavoriteColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :artworks, :artist_favorite, :boolean, :default => false
    add_column :artwork_shares, :viewer_favorite, :boolean, :default => false
  end
end
