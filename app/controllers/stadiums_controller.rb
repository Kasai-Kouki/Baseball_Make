class StadiumsController < ApplicationController
  def new
    @stadium =Stadium.new
  end
  
  def create
    @stadium =Stadium.new(stadium_params)
    if @stadium.save
      redirect_to new_stadium_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  
  private 
   def stadium_params
     params.require(:stadium).permit(:name)
    end
end


