class GamesController < ApplicationController
  def new
    @game =Game.new
  end
  
  def create
    @game =Game.new(game_params)
    @game.user_id = current_user.id
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
  
  def search
      @games = Game.where(stadium_id: params[:stadium][:stadium_id], category_id: params[:category][:category_id])
      render :index
  end
  
  private 
   def game_params
     params.require(:game).permit(:start_at, :category_id, :stadium_id)
    end
end
