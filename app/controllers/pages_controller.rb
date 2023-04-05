class PagesController < ApplicationController
    def index
      @rooms = Room.search(params[:search])
      @rooms = Room.where("roomname like ?", "%#{params[:keyword]}%")
    end

    def show
      @user = current_user
    end
end
