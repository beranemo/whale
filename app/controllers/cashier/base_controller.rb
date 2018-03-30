class Cashier::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_officer

  private

  def authenticate_officer
    if current_user.cashier?
    elsif current_user.admin?
    else
      flash[:alert] = "You are not cashier!"
      redirect_to root_path
    end
  end
end
