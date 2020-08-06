class User < ApplicationRecord
  has_many :user_rooms, dependent: :destroy
  has_many :rooms, through: :user_rooms
  has_many :posts, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true, length: {maximum: 50}
  validates :native, presence: true
  validates :study, presence: true
  validates :gender, presence: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :img, ImageUploader
  
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
