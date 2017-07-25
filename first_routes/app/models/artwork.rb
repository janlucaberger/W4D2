class Artwork < ApplicationRecord
  validates :title, uniqueness: { scope: :artist_id }
  validates :title, :artist_id, presence: true

  belongs_to :artist,
    class_name: :User,
    foreign_key: :artist_id

  has_many :shares,
    class_name: :ArtworkShare,
    foreign_key: :artwork_id

  has_many :shared_vieweres,
    through: :shares,
    source: :viewer

  has_many :comments

  has_many :likes, as: :likeable,
    foreign_key: :likeable_id

  has_many :likers,
  through: :likes,
  source: :user

end
