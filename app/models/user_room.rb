class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room, dependent: :destroy
end
