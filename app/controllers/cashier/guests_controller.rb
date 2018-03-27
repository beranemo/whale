class Cashier::GuestsController < Cashier::BaseController

  before_action :set_guest, only:  [:edit, :update, :destroy]

  def index
    # @guests = Guest.all.order(created_at: :desc)
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.user_id = current_user.id
    if @guest.save
      flash[:notice] = "成功新增客情紀錄"
      redirect_to guest_today_cashier_guests_path
    else
      flash.now[:alert] = @guest.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @guest.update(guest_params)
      flash[:notice] = "成功更新客情紀錄"
      redirect_to guest_today_cashier_guests_path
    else
      flash.now[:alert] = @guest.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @guest.destroy
    redirect_to guest_today_cashier_guests_path
    flash[:alert] = "客情紀錄已刪除"
  end

  def guest_today
    # @guests = Guest.where("Date(created_at) = ?", Date.today).order(created_at: :desc)
    @guests = Guest.where("created_at >= ?", Time.zone.now.beginning_of_day).order(created_at: :desc)
    # @guests = Guest.all
    puts @guests

  end 

  def guest_analysis
    @guests = Guest.where("created_at >= ?", Time.zone.now.beginning_of_day)
#    @old_guests = @guests.where(guest_type_id: 2)
#    @new_guests = @guests.where(guest_type_id: 1)
    @boy_guests = @guests.where(gender: "男")
    @girl_guests = @guests.where(gender: "女")
#    @tw_guests = @guests.where(country_id: 1)
#    @jp_guests = @guests.where(country_id: 2)
#    @hk_guests = @guests.where(country_id: 3)
#    @twenty_guests = @guests.where(age_id: 1)
#    @thirty_guests = @guests.where(age_id: 2)
#    @forty_guests = @guests.where(age_id: 3)
#    @pass_guests = @guests.where(info_way_id: 1)
#    @expo_guests = @guests.where(info_way_id: 2)
#    @family_guests = @guests.where(info_way_id: 3)
#    @toilet_guests = @guests.where(info_way_id: 4)
    
    total = 0
    @guests.each do |g|
      total = total + g.payment.to_i
    end
    
    @total_payment = total

    @arr_x = [10,11,12,13,14,15,16,17,18,19,20,21,22]
    @arr_y = [0,0,0,0,0,0,0,0,0,0,0,0,0]

  end

  def search_outcome
    date = Date.parse(params[:created_at]).to_time
    #@guests = Guest.where("cast(strftime('%D', created_at) as int) = ?", date)
    puts date
    @guests = Guest.where(created_at: date.beginning_of_day..date.end_of_day)
    @guests.each do |g|
      g.created_at.in_time_zone('Taipei')
    end
    render :json => @guests.to_json(:include => [:age, :country, :guest_type, :info_way, :user])
  end

  private

  def guest_params
    params.require(:guest).permit(:payment, :gender, :guest_type_id, :country_id, :age_id, :info_way_id, :user_id, :remark)
  end

  def set_guest
    @guest = Guest.find(params[:id])
  end

end
