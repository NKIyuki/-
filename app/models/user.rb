class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :avatar
  
  has_many :posts

  has_one_attached:profile_image

  def get_profile_image(width, height)
    unless avatar.attached?
      file_path = Rails.root.join('app/assets/images/user.jpeg')
      avatar.attach(io:File.open(file_path),filename:'user.jpeg',content_type:'image/jpeg')
    end
    avatar.variant(resize_to_limit:[width, height]).processed
  end
end
