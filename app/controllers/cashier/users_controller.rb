class Cashier::UsersController < ApplicationController
  def index
    @users = User.group_by_cashier
  end
  
  def to_resigned
    @user = User.find(params[:id])
    @user.to_resigned
    
    redirect_to cashier_users_path
  end
  
  def to_in_service
    @user = User.find(params[:id])
    @user.to_in_service
    
    redirect_to cashier_users_path
  end  
end
