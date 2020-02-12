class GamesController < ApplicationController
  def new
    @game =Game.new
  end
  
  def create
    @game =Game.new(game_params)
    @game.user_id = current_user.id
    binding.pry
    if @game.save
      redirect_to new_game_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def index
    @games = Game.all
  end
  
  private 
   def game_params
     params.require(:game).permit(:start_at, :category_id, :stadium_id)
    end
end
