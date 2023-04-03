class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]

  def show
    @user = current_user
  end

  def mypage
    redirect_to user_path(current_user)
  end

  def edit

  end

  def update
    if current_user.update(user_params)

    else
        redirect_to edit_user_path(current_user)
    end
  end
end
