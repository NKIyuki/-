class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :comments,dependent: :destroy
  has_one_attached:profile_image
  has_many :favorites,dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com',name: 'ゲスト' ) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end



  def get_profile_image(width, height)
    unless avatar.attached?
      file_path = Rails.root.join('app/assets/images/user.jpeg')
      avatar.attach(io:File.open(file_path),filename:'user.jpeg',content_type:'image/jpeg')
    end
    avatar.variant(resize_to_limit:[width, height]).processed
  end
end
