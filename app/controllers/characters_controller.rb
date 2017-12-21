class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /characters
  # GET /characters.json

  def index
    characters = Character.where 'user_id == ?', current_user.id
    if characters[0] == nil then
      character = Character.new
      character.user_id = current_user.id
      character.name = '<<noname>>'
      character.save
      characters = Character.where 'user_id == ?', current_user.id
    end
    @character = characters[0]
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
    @character = Character.find params[:id]
  end

  # GET /characters/new
  def new
    redirect_to '/board_messages'
  end

  # GET /characters/1/edit
  def edit
    redirect_to '/board_messages'
  end

  # POST /characters
  # POST /characters.json
  def create
    redirect_to '/board_messages'
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to '/board_messages' }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :index }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    redirect_to '/board_messages'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:name, :user_id, :memo)
    end
end
