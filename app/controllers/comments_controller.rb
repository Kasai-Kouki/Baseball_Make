class CommentsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(content_params)
    @comment.game_id = params[:game_id]

    if @comment.save
      redirect_to games_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  private
  def content_params
    params.require(:comment).permit(:content)
  end 
end

