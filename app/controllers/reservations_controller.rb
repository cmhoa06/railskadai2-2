class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = current_user.reservations
  end

  def new
    @user = current_user
    @reservation = Reservation.new
  
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @user = User.find_by(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    
    if @reservation.save
      binding.pry
      flash[:notice] = "予約に成功しました"
      redirect_to reservations_path
    else
      binding.pry
      flash.now[:alert] = "予約に失敗しました"
      render 'rooms/show'
    end
  end

  def show
    @reservation =Reservation.find(params[:id])
  end

  def edit
    @rooms = Room.all
    @reservation = Reservation.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def reservation_params
    params.require(:reservation).permit(:checkin_at, :checkout_at, :person_count , :user_id , :room_id , :total_price , :total_day)
  end
end
