class PagesController < ApplicationController
  before_action :set_q, only: [:index, :search]

    def index
    end

    def show
      @user = current_user
    end
    def search
      @results = @q.result
    end
  
    private
  
    def set_q
      @q = Room.ransack(params[:q])
    end
end
