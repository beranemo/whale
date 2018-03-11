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
      puts key_word
      @member = Member.find_by("phone like ?", "%"+key_word+"%")
      render :json => {:id => @member.id, :name => @member.name, :phone =>@member.phone, :gender => @member.gender, :email => @member.email, :birthday => @member.birthday}
    elsif params[:email] != nil
      key_word = params[:email]
      @member = Member.find_by("email like ?", "%"+key_word+"%")
      render :json => {:id => @member.id, :name => @member.name, :phone =>@member.phone, :gender => @member.gender, :email => @member.email, :birthday => @member.birthday}
    else
      month = Date.current.month 
      @members = Member.where("cast(strftime('%m', birthday) as int) = ?", month)
      render :json => @members
    end

    
  end


  def checkout
    
    render :checkout
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
