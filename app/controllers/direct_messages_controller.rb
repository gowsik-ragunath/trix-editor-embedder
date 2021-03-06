class DirectMessagesController < ApplicationController
    before_action :set_room, only: [:create]

	def index
		@direct_messages = current_user.direct_messages
		@direct_message = current_user.direct_messages.new
	end

	def new
	end

	def create
		@direct_message = current_user.direct_messages.new(direct_message_params)

		respond_to do |format|
			@direct_message.room = @room
			@direct_message.user = current_user

			if @direct_message.save
        		ActionCable.server.broadcast("room_channel_#{@room.id}", 
        									 message: @direct_message.message.body.to_plain_text,
        									 user_email: current_user.email)
                format.json { render :show, status: :created, location: @direct_message }
                format.js
			else
		        format.json { render json: @direct_message.errors, status: :unprocessable_entity }
			end
		end
	end

	private


		def set_room
			@room = Room.find_by(id: params[:room_id])
		end

        # Never trust parameters from the scary internet, only allow the white list through.
        def direct_message_params
            params.fetch(:direct_message, {}).permit(:message)
        end
end
