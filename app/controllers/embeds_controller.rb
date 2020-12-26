class EmbedsController < ApplicationController
    protect_from_forgery with: :null_session

    # POST /embeds
    # POST /embeds.json
    def create
        @embed = Embed.new(embed_params)

        respond_to do |format|
            if @embed.save
                format.json { render :show, status: :created }
            else
                format.json { render json: @embed.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    # Never trust parameters from the scary internet, only allow the white list through.
    def embed_params
        params.require(:embed).permit(:url)
    end
end
