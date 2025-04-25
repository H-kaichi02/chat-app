class Room < ApplicationRecord
  belongs_to :room_users
  has_many :users, through: :room_users
end
