class BoardMessagesController < ApplicationController
  before_action :set_board_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /board_messages
  # GET /board_messages.json
  def index
    @board_messages = BoardMessage.page(params[:page]).order('created_at desc')
    characters = Character.where 'user_id == ?', current_user.id
    if characters[0] == nil then
      character = Character.new
      character.user_id = current_user.id
      character.name = '<<noname>>'
      character.save
      characters = Character.where 'user_id == ?', current_user.id
    end
    @character = characters[0]
    @board_message = BoardMessage.new
    @board_message.character_id = @character.id
  end

  # GET /board_messages/1
  # GET /board_messages/1.json
  def show
    redirect_to '/board_messages'
  end

  # GET /board_messages/new
  def new
    redirect_to '/board_messages'
  end

  # GET /board_messages/1/edit
  def edit
    sleep 3
    redirect_to '/board_messages'
  end

  # POST /board_messages
  # POST /board_messages.json
  def create
    @board_messages = BoardMessage.page(params[:page]).order('created_at desc')
    @board_message = BoardMessage.new(board_message_params)
    @character = Character.where('user_id == ?', current_user.id)[0]
    respond_to do |format|
      if @board_message.save
        format.html { redirect_to '/board_messages' }
        format.json { render :show, status: :created, location: @board_message }
      else
        format.html { render :index }
        format.json { render json: @board_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /board_messages/1
  # PATCH/PUT /board_messages/1.json
  def update
    redirect_to '/board_messages'
  end

  # DELETE /board_messages/1
  # DELETE /board_messages/1.json
  def destroy
    redirect_to '/board_messages'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_message
      @board_message = BoardMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_message_params
      params.require(:board_message).permit(:content, :character_id)
    end
end
