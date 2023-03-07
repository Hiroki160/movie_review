class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました！"
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

end
