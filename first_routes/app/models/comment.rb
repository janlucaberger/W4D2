class Comment < ApplicationRecord

  validates :description, :commenter_id, :artwork_id, presence: true

  belongs_to :commenter,
    class_name: :User,
    foreign_key: :commenter_id

  belongs_to :artwork

  has_many :likes, as: :likeable,
    foreign_key: :likeable_id

end
