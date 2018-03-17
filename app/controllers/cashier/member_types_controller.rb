class Cashier::MemberTypesController < ApplicationController
  before_action :set_member, only: [:update, :destroy]

  def index
    @members = MemberType.all
    @member = MemberType.new
  end
  
  def update
    if @member.update(member_params)
      redirect_to cashier_member_types_path
      flash[:notice] = "會員群組資料已更新"
    else
      @members = MemberType.all
      render :index
    end
  end
  
  def create
    @member = MemberType.new(member_params)
    
    if @member.save
      flash[:notice] = "會員群組內容已成功新增"
      redirect_to cashier_member_types_path
    else
      @members = MemberType.all
      render :index
    end
    
  end
  
  def destroy   
    if @member.destroy
      flash[:notice] = "會員群組內容已成功刪除"
      redirect_to cashier_member_types_path
    else
      @members = MemberType.all
      render :index
    end
  end
  
  private
  def member_params
    params.require(:member_type).permit(:value)
  end
  
  def set_member
    @member = MemberType.find(params[:id])
  end  
end
