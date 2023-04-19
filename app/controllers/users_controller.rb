class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]

  def show
    @user = current_user
  end

  def mypage
    redirect_to user_path(current_user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = "更新しました"
      redirect_to root_path
    else
      redirect_to edit_user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
