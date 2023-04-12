class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = Reservation.all
  end

  def new
    @user = current_user
    @reservation = Reservation.new
    
  end

  def confirm
      @reservation = Reservation.new(reservation_params)
      @user = current_user
      @room = Room.find(params[:reservation][:room_id])
      binding.pry
      @total_day = (@reservation.checkout_at - @reservation.checkin_at).to_i
      @total_price = @total_day * @room.fee * @reservation.person_count
     binding.pry
      if @total_day <= 0
        redirect_to @room, alert:"終了日は開始日より後にしてください"
      elsif @reservation.person_count <=0 
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
    #@reservation = Reservation.find(params[:id])
    
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
    params.require(:reservation).permit(:checkin_at, :checkout_at, :person_count , :user_id, :room_id , :created_at , :updated_at)
  end
end
