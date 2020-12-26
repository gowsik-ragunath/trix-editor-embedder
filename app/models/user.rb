class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :validatable

	# Associations
	has_many :thoughts
	has_many :rooms
	has_many :direct_messages

	has_many :room_direct_messages
	has_many :user_direct_messages, through: :room_direct_messages, source: :direct_message
	has_many :user_rooms, through: :room_direct_messages, source: :room
end
