class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @reservations = current_user.reservations
  end

  def new
    @user = current_user
    @reservation = Reservation.new
    
  end

  def confirm
      @reservation = Reservation.new(reservation_params)
      @user = current_user
      @room = Room.find(params[:reservation][:room_id])
      if @reservation.checkin_at == nil
        redirect_to @room, alert:"(開始日）を入力してください"
      elsif @reservation.checkout_at == nil
        redirect_to @room, alert:"(終了日）を入力してください"
      elsif @reservation.checkout_at < @reservation.checkin_at
        redirect_to @room, alert:"(終了日）は開始日以降の日付にしてください"
      end
     
      @total_day = (@reservation.checkout_at - @reservation.checkin_at).to_i 
      @total_price = (total_day * person_count * room.fee)

      if @total_day == 0
        redirect_to @room, alert:"終了日は開始日より後にしてください"
      elsif @reservation.person_count == 0
        redirect_to @room, alert:"正しい人数を入力してください"
      end
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @user = User.find_by(params[:reservation][:room_id])
    @reservation = Reservation.new(params.require(:reservation).permit(:checkin_at, :checkout_at, :person_count, :user_id, :room_id ,:created_at , :updated_at))
    
    if @reservation.save
   
      flash[:notice] = "予約に成功しました"
      redirect_to reservations_path (@reservation)
    else
      flash.now[:alert] = "予約に失敗しました"
      render "rooms/show"
    end
  end

  def show
    @user = current_user
    @reservations = Reservation.all
  end

  def edit
    @rooms = Room.all
    @reservation = Reservation.find(params[:id])
  end

  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "削除しました"
    redirect_to reservations_path
  end

  def reservation_params
    params.require(:reservation).permit(:checkin_at, :checkout_at, :person_count , :user_id, :room_id , :created_at , :updated_at)
  end
end
