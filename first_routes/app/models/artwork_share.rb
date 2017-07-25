class ArtworkShare < ApplicationRecord

  validates :artwork_id, :viewer_id, presence: true

  validate :val_art_not_viewer

  belongs_to :viewer,
  class_name: :User,
  foreign_key: :viewer_id

  belongs_to :artwork,
  class_name: :Artwork,
  foreign_key: :artwork_id

  private

  def val_art_not_viewer
    if Artwork.find(artwork_id).artist_id == viewer_id
      raise "artist can't be the viewer"
    end
  end

end
