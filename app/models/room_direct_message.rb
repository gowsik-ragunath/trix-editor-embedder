class RoomDirectMessage < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :direct_message
end
