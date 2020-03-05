class RecruitmentsController < ApplicationController
  def new
    @recruitment =Recruitment.new
  end
  
  def create
    @recruitment =Recruitment.new(recruitment_params)
    @recruitment.enemy_id = current_user.id
    
    if @recruitment.save
      redirect_to game_path(game.id) 
    else
      redirect_to game_path(game.id)
    end
  end
  
  def recruitment_params
     params.require(:recruitment).permit(:game_id, :enemy_id)
  end
end


