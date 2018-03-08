class Cashier::GuestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @guests = Guest.all
  end

  def new
    @guest = Guest.new
  end

end
