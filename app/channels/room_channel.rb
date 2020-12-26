class RoomChannel < ApplicationCable::Channel

	def subscribed
		stream_from room
	end

	def unsubscribed
		# Any cleanup needed when channel is unsubscribed
	end

	private

		def room
			Room.find_by(id: params[:room])
		end

	
end
