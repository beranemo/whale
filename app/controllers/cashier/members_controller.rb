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
   
    if params[:phone] != ""
      @member = Member.find_by(phone: params[:phone])
      render :json => {:id => @member.id, :name => @member.name, :phone =>@member.phone, :gender => @member.gender, :birthday => @member.birthday}
    elsif params[:email] != ""
      @member = Member.find_by(email: params[:email])
      render :json => {:id => @member.id, :name => @member.name, :phone =>@member.phone, :gender => @member.gender, :birthday => @member.birthday}
    else
      render :search
    end

    
  end


  def checkout
    
    render :checkout
  end
  private

  def member_params
    params.require(:member).permit(:name,:gender,:birthday,
                                  :phone,:email,:skin,:hair,
                                  :avatar,:remark)
  end
end
