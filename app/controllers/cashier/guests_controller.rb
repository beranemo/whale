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
    @order = Order.find_by(guest_id: @guest.id)
    if @order
      @order.guest_id = nil
      @order.save!
    end
    @guest.destroy
    redirect_to guest_today_cashier_guests_path
    flash[:alert] = "客情紀錄已刪除"
  end

  def guest_today
    # @guests = Guest.where("Date(created_at) = ?", Date.today).order(created_at: :desc)
    @guests = Guest.where("created_at >= ?", Time.zone.now.beginning_of_day).order(created_at: :desc)
    # @guests = Guest.all
    # puts @guests

  end 

  def guest_analysis
    @guests = Guest.where("created_at >= ?", Time.zone.now.beginning_of_day)
    @gender_hash = @guests.group_by{|h| h[:gender]}.map{|k,v| [k, v.size]}.to_h
    @guest_type_hash = @guests.group_by{|h| h.guest_type.guest_type}.map{|k,v| [k, v.size]}.to_h
    @country_hash = @guests.group_by{|h| h.country.name_zh_tw}.map{|k,v| [k, v.size]}.to_h
    @age_hash = @guests.group_by{|h| h.age.age_type}.map{|k,v| [k, v.size]}.to_h
    @info_way_hash = @guests.group_by{|h| h.info_way.news_channel}.map{|k,v| [k, v.size]}.to_h

    total = 0
    @guests.each do |g|
      total = total + g.payment.to_i
    end
    
    @total_payment = total

    @arr_x = [10,11,12,13,14,15,16,17,18,19,20,21,22]
    @arr_y = [0,0,0,0,0,0,0,0,0,0,0,0,0]

  end

  def search_outcome
    s_date = Date.parse(params[:s_date]).to_time
    e_date = Date.parse(params[:e_date]).to_time
    puts s_date
    puts e_date
    @guests = Guest.where(created_at: s_date.beginning_of_day..e_date.end_of_day).order(created_at: :asc)
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
