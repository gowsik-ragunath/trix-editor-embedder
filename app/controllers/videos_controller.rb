class VideosController < ApplicationController
	before_action :set_video, only: [:show]

	def index
		@videos = Video.all
	end

	def new
		@video = Video.new
	end

	def create
		@video = Video.new(video_params)
		respond_to do |format|
			if Video.save
				format.html { redirect_to @video, notice: "Video has been uploaded" }
			else
                format.html { render :new }
			end
		end
	end

	def show

	end

	private

		def set_video
			@video = Video.find_by(id: params[:id])
		end

		def video_params
			params.fetch(:video, {}).permit(:title, :clip, :thumbnail)
		end

end
