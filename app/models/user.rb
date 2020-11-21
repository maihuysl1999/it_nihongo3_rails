class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :avatar   
  
  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: '150x150!').processed
    end
  end
  
  validates :name, presence: true
  validates :age, presence: true
end
