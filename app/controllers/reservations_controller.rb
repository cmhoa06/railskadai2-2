class ReservationsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @reservation = @room.reservation.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to @room, notice: "予約が完了しました"
    else
      render 'rooms/show'
    end
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :person_count)
  end
end
