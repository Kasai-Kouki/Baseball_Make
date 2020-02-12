class CategoriesController < ApplicationController
  def new
    @category =Category.new
  end
  
  def create
    @category =Category.new(category_params)
    if @category.save
      redirect_to new_category_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  
  private 
   def category_params
     params.require(:category).permit(:category)
    end
end
