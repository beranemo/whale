class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update]

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    @user.update(user_params)
    redirect_to guest_today_cashier_guests_path
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :intro)
  end  
end
