class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show] 
  before_action :set_q, only: [:index, :search]

  def index
    @user = current_user
    @rooms = current_user.rooms #ログインユーザーの登録施設のみ表示
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @user = current_user
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = '宿泊施設を登録しました'
      redirect_to @room 
    else
      render :new
    end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
        flash[:notice] = '宿泊施設を更新しました'
        redirect_to @room   
    else
        render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_url , notice: '宿泊施設を削除しました'
  end

  def search
    @results = @q.result
    @numbers = @q.result.count
  end

  private
  def room_params
    params.require(:room).permit(:name, :introduction, :fee, :address, :image, :room_id).merge(user_id: current_user.id)
  end

  def set_q
    @q = Room.ransack(params[:q])
  end
end