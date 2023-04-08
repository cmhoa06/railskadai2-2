class PagesController < ApplicationController
    def index
      @rooms = Room.search(params[:search])
      @rooms = Room.where("address like ?", "%#{params[:keyword]}%")
    end

    def show
      @user = current_user
    end
end
