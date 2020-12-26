class DirectMessage < ApplicationRecord
	# Associations
	has_many :users
    has_rich_text :message

	has_one :room_direct_message
	has_one :room, through: :room_direct_message, source: :room
	has_one :user, through: :room_direct_message, source: :user
end
