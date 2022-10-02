class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
    @rooms = Room.all
    @users = User.all
  end
  
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :person_num, :total_price, :room_id).merge(user_id: current_user.id))
    if @reservation.save
      flash[:notice] = "「予約番号#{@reservation.id}」を新規登録しました。"
      redirect_to :rooms
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(params.require(:reservation).permit(:start_date, :end_date, :person_num, :total_price, :reservation_pic))
      flash[:notice] = "「予約番号#{@reservation..id}」の情報を更新しました。"
      redirect_to :rooms
    else
      render "edit"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:alert] = "「#{@reservation.reservation_name}」を削除しました。"
    redirect_to :reservations, status: 303
  end


end
