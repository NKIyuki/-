class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :comments,dependent: :destroy
  has_many :favorites,dependent: :destroy

  def favoried_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
