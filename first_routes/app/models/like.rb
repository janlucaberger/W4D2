class Like < ApplicationRecord
  validates :likeable_type, :likeable_id, :user_id, presence: true
  validate :val_liked_type

  belongs_to :likeable, polymorphic: true, optional: true,
    foreign_key: :likeable_id

  belongs_to :user

  private
    def val_liked_type
      if likeable_type != 'Artwork' && likeable_type !='Comment'
        raise "wrong liked_type"
      end
    end

end
