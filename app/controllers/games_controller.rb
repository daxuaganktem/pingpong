require_relative '../utils/utilities.rb'
class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
    if @games.blank?
      
    else
      render json: GameBlueprint.render(@games), status: :ok
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    if @game.nil?
      
    else
      render json: GameBlueprint.render(@game), status: :ok
    end
  end

  # GET /games/new
  def new
    @game = Game.new
  end     

  # GET /games/1/edit
  def edit
  end

  # POST /gamesPOST
  # POST /games.json
  def create
    utilities = Utilities.new
    @game = Game.new(game_params)
      if @game.save
        utilities.increase_win_loss(@game)
        redirect_to games_path
      else
        render "new"
      end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    @game.update(game_params)
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    utilities = Utilities.new
    utilities.decrease_win_loss(@game)
    @game.destroy
      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:player1, :player2, :point1, :point2)
    end
end
