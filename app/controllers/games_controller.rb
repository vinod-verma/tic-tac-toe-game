class GamesController < ApplicationController
  before_action :get_game, only: %i[ edit ]

  def index
    @game = Game.find params[:format]
    if params[:game_info] == 'draw'
      @game.winner = 'draw'
    else
      @game.winner = params[:game_info] == 'X' ? @game.player_1 : @game.player_2
    end
    @game.status = 'finished'
    @game.save
    redirect_to new_game_path
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.status = "running"

    if @game.save
      redirect_to edit_game_path(@game), notice: "Game started successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def game_params
    params.require(:game).permit(:player_1, :player_2)
  end

  def get_game
    @game = Game.find params[:id]
    redirect_to new_game_path unless @game
  end
end
