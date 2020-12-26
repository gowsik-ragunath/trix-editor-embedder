class Room < ApplicationRecord
	belongs_to :user

	has_many :room_direct_messages
	has_many :room_users, through: :room_direct_messages, source: :user
end
