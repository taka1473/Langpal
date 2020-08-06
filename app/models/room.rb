class Room < ApplicationRecord
    has_many :user_rooms, dependent: :destroy
    has_many :users, through: :user_rooms
    has_many :posts, dependent: :destroy
    
    validates :name, presence: true
    validates :comment, presence: true
end
