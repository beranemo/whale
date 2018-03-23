class Cashier::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_cashier

  private

  def authenticate_cashier
    unless current_user.cashier?
      flash[:alert] = "You are not cashier!"
      redirect_to root_path
    end
  end
end
