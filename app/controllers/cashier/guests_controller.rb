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
    # @guests = Guest.where("Date(created_at) = ?", Date.today).order(created_at: :desc)
    @guests = Guest.where("created_at >= ?", Time.zone.now.beginning_of_day)
    # @guests = Guest.all
    puts @guests

  end 

  def guest_analysis
    @guests = Guest.where("created_at >= ?", Time.zone.now.beginning_of_day)
    @old_guests = @guests.where(guest_type_id: 10)
    @new_guests = @guests.where(guest_type_id: 9)
    @boy_guests = @guests.where(gender: "男")
    @girl_guests = @guests.where(gender: "女")
    @tw_guests = @guests.where(country_id: 1)
    @jp_guests = @guests.where(country_id: 2)
    @hk_guests = @guests.where(country_id: 3)
    @twenty_guests = @guests.where(age_id: 13)
    @thirty_guests = @guests.where(age_id: 14)
    @forty_guests = @guests.where(age_id: 15)
    @pass_guests = @guests.where(info_way_id: 17)
    @expo_guests = @guests.where(info_way_id: 18)
    @family_guests = @guests.where(info_way_id: 19)
    @toilet_guests = @guests.where(info_way_id: 20)
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
