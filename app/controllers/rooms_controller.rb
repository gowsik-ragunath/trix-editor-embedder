class RoomsController < ApplicationController
    before_action :set_room, only: [:show]

	def index
		@rooms = current_user.rooms
	end

	def new
	end

	def create
		@room = current_user.rooms.new

		respond_to do |format|
			if @room.save
                format.html { redirect_to root_url, notice: 'Room was successfully created.' }
                format.json { render :show, status: :created, location: @room }
                format.js
			else
		        format.json { render json: @room.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
		@direct_messages = current_user.direct_messages
		@direct_message = current_user.direct_messages.new
	end

	private

		def set_room
			@room = Room.find_by(id: params[:id])
		end
end
