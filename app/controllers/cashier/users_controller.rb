class Cashier::UsersController < ApplicationController
  def index
    @users = User.group_by_cashier
  end
end
