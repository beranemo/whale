class Cashier::MembersController < ApplicationController
  before_action :authenticate_user!

  def index
    @members = Member.all.limit(10)
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save!
      flash[:notice] = "成功新增會員"
      redirect_to cashier_root_path
    else
      flash[:alert] = @member.errors.full_messages.to_sentence
      render :new
    end
  end

  def search
    
  end

 
  def search_outcome
    puts params[:phone]
    key_word = ''
    if params[:phone] != nil
      key_word = params[:phone]
      @member = Member.where("phone like ?", "%"+key_word+"%")
      puts @member
      # 當@member 回傳有多筆資料時，前端介面資料承接方式要改一下
      # FIXME
      render :json => {:id => @member.id, :name => @member.name, :phone =>@member.phone, :gender => @member.gender, :email => @member.email, :birthday => @member.birthday}
    elsif params[:email] != nil
      key_word = params[:email]
      # find_by 只會找出一筆資料，用 where 才能找出多筆，這裡還未改成 where 方便與 phone 的 where 辨異
      # FIXME
      @member = Member.find_by("email like ?", "%"+key_word+"%")
      render :json => {:id => @member.id, :name => @member.name, :phone =>@member.phone, :gender => @member.gender, :email => @member.email, :birthday => @member.birthday}
    else
      month = Date.current.month 
      @members = Member.where("cast(strftime('%m', birthday) as int) = ?", month)
      render :json => @members
    end

    
  end


  def checkout
    @products = Product.all 
    @order_items = current_order.order_items.all

  end
  private

  def member_params
    params.require(:member).permit(
      :name,
      :gender,
      :birthday,
      :phone,
      :email,
      :skin_type_id,
      :hair_code,
      :avatar,
      :remark
      )
  end
end
