class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true

  has_many :artworks,
  foreign_key: :artist_id

  has_many :shares,
  class_name: :ArtworkShare,
  foreign_key: :viewer_id

  has_many :shared_artworks,
  through: :shares,
  source: :artwork

  has_many :comments,
  foreign_key: :commenter_id

  has_many :likes
end
