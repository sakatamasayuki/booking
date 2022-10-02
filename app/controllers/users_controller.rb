class UsersController < ApplicationController
  
  def index
    @users = User.all
    @rooms = Room.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:user_name, :user_intro, :user_pic))
    if @user.save
      flash[:notice] = "「#{@user.user_name}」を新規登録しました。"
      redirect_to :users
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:user_name, :user_intro, :user_pic))
      flash[:notice] = "「#{@user.user_name}」の情報を更新しました。"
      redirect_to :users
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:alert] = "「#{@user.user_name}」を削除しました。"
    redirect_to :users, status: 303
  end

end
