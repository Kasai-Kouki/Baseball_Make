class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def show
    @user = User.find(current_user.id)
    @category = Category.new
    @stadium = Stadium.new
    @area = Area.new
    @game = Game.new
    @room_id = message_room_id(current_user, @user)
    @messages = Message.recent_in_room(@room_id)
  end
  
  def edit
     @user = User.find_by(id: params[:id],is_delete: false)
  end
  
  def index
    @users = User.where(is_delete: false)
  end
  
  def search
      @users = User.where(area_id: params[:area][:area_id], category_id: params[:category][:category_id],is_delete: false)
      render :index
  end
  
  def update
    @user = User.find(params[:id])
    if current_user == @user
 
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        redirect_to user_path(id: @user.id)
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end 
    end
 
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.is_delete = '1'
    @user.save
     render template: "pages/index"
  end
  
  def message_room_id(first_user, second_user)
  first_id = first_user.id.to_i
  second_id = second_user.id.to_i
  if first_id < second_id
    "#{first_user.id}-#{second_user.id}"
  else
    "#{second_user.id}-#{first_user.id}"
  end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email,:teamname,:password, :password_confirmation,:area_id,:category_id)
  end
end