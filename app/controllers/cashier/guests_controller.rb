class Cashier::GuestsController < ApplicationController

  before_action :set_guest, only:  [:edit, :update, :destroy]

  def index
    @guests = Guest.all.order(created_at: :desc)
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.user_id = current_user.id
    if @guest.save
      flash[:notice] = "成功新增客情紀錄"
      redirect_to cashier_guests_path
    else
      flash.now[:alert] = @guest.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @guest.update(guest_params)
      flash[:notice] = "成功上傳客情紀錄"
      redirect_to cashier_guests_path(@guest)
    else
      flash.now[:alert] = @guest.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @guest.destroy
    redirect_to cashier_guests_path
    flash[:alert] = "客情紀錄已刪除"
  end

  def guest_today
    @guests = Guest.all.order(created_at: :desc)
  end 

  def search_outcome

    date = params[:created_at]
    @guests = Guest.where("cast(strftime('%D', created_at) as int) = ?", date)
    render :json => @guests
  end

  private

  def guest_params
    params.require(:guest).permit(:payment, :gender, :guest_type_id, :country_id, :age_id, :info_way_id, :user_id)
  end

  def set_guest
    @guest = Guest.find(params[:id])
  end

end
