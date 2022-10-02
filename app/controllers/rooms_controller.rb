class RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
    @users = User.all
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_intro, :price, :address, :room_pic).merge(user_id: current_user.id)  )
    if @room.save
      flash[:notice] = "「#{@room.room_name}」を新規登録しました。"
      redirect_to :rooms
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:room_name, :room_intro, :room_pic, :price, :address))
      flash[:notice] = "「#{@room.room_name}」の情報を更新しました。"
      redirect_to :rooms
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:alert] = "「#{@room.room_name}」を削除しました。"
    redirect_to :rooms, status: 303
  end

end
