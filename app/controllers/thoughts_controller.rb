class ThoughtsController < ApplicationController
    protect_from_forgery with: :null_session
    
    skip_before_action :authenticate_user!, only: [:dynamic_extension_content, :extension_create]
    before_action :set_thought, only: [:show, :edit, :update, :destroy]

    # GET /thoughts
    # GET /thoughts.json
    def index
        @thoughts = Thought.all
    end

    # GET /thoughts/1
    # GET /thoughts/1.json
    def show
    end

    # GET /thoughts/new
    def new
        @thought = current_user.thoughts.new
    end

    # GET /thoughts/1/edit
    def edit
    end

    # POST /thoughts
    # POST /thoughts.json
    def create
        @thought = current_user.thoughts.new(thought_params)

        respond_to do |format|
            if @thought.save
                format.html { redirect_to @thought, notice: 'Thought was successfully created.' }
                format.json { render :show, status: :created, location: @thought }
            else
                format.html { render :new }
                format.json { render json: @thought.errors, status: :unprocessable_entity }
            end
        end
    end

    def extension_create
        @thought = current_user.thoughts.new(content: params[:links])

        p params[:links]
        p "^^^"

        if @thought.save
            render json: @thought.to_json
        end
    end

    # PATCH/PUT /thoughts/1
    # PATCH/PUT /thoughts/1.json
    def update
        respond_to do |format|
            if @thought.update(thought_params)
                format.html { redirect_to @thought, notice: 'Thought was successfully updated.' }
                format.json { render :show, status: :ok, location: @thought }
            else
                format.html { render :edit }
                format.json { render json: @thought.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /thoughts/1
    # DELETE /thoughts/1.json
    def destroy
        @thought.destroy
        respond_to do |format|
            format.html { redirect_to thoughts_url, notice: 'Thought was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    def dynamic_extension_content
        render json: { signed_in: current_user.present? }
    end

    private

        # Use callbacks to share common setup or constraints between actions.
        def set_thought
            @thought = current_user.thoughts.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def thought_params
            params.fetch(:thought, {}).permit(:content)
        end
end
