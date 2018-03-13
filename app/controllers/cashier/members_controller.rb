class Cashier::MembersController < ApplicationController
  before_action :authenticate_user!

  def index
    @members = Member.all
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
      @members = Member.where("phone like ?", "%"+key_word+"%")      
    elsif params[:email] != nil
      key_word = params[:email]
      @members = Member.where("email like ?", "%"+key_word+"%")
      puts @members
    else
      month = Date.current.month 
      @members = Member.where("cast(strftime('%m', birthday) as int) = ?", month)
    end
    render :json => @members
    
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
