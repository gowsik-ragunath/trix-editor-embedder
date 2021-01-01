class RoomChannel < ApplicationCable::Channel

	def subscribed
		stream_from channel_name
	end

	def unsubscribed
		# Any cleanup needed when channel is unsubscribed
	end

	private
		def channel_name
			p room
			p "!!!"
			"room_channel_#{room.id}"
		end

		def room
			Room.find_by(id: params[:room])
		end

	
end
