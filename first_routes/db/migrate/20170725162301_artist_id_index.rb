class ArtistIdIndex < ActiveRecord::Migration[5.0]
  def change
    remove_index :artworks, ["title", "artist_id"]
    add_index :artworks, [:artist_id, :title], :unique => true
  end
end
