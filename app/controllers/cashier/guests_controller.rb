class Cashier::GuestsController < ApplicationController

  def index
    @guests = Guest.all.order(created_at: :desc)
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      flash[:notice] = "成功新增客情紀錄"
      redirect_to cashier_guests_path
    else
      flash.now[:alert] = @guest.errors.full_messages.to_sentence
      render :new
    end
  end

  def guest_today
    @guests = Guest.all.order(created_at: :desc)
  end 

  private

  def guest_params
    params.require(:guest).permit(:payment, :gender, :guest_type_id, :country_id, :age_id, :info_way_id)
  end

end
