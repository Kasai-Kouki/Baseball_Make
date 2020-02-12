class AreasController < ApplicationController
  def new
    @area = Area.new
  end
  
  def create
    @area = Area.new(area_params)
    if @area.save
      redirect_to new_area_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  
  private 
   def area_params
     params.require(:area).permit(:name)
    end
end

