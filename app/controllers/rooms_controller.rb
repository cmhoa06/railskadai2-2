class RoomsController < ApplicationController
  def index
    
    @rooms = Room.all
    @user = current_user
  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @user = current_user
    @room = Room.new(room_params)
    

    if @room.save
      redirect_to @room , notice: '宿泊施設を登録しました'
    else
      render :new
    end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    @rooms = Room.all
    @rooms = @rooms.where(area: params[:area]) if params[:area].present?
    @rooms = @rooms.where("name like?" , "%#{params[:keyword]}%") if params[:keyword].present?
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
        redirect_to @room , notice: '宿泊施設を更新しました'
      else
        render :edit
      end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_url , notice: '宿泊施設を削除しました'
  end

  private
  def room_params
    params.require(:room).permit(:roomname, :description, :price, :address, :image, :user_id)
  end
  
end
