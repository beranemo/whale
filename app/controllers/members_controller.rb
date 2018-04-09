class MembersController < ApplicationController
  def indx
    
  end

  def new
    @member = Member.new
  end
  
  def show
    @member = Member.find(params[:id])  
  end

  def create
    @member = Member.new(member_params)
    @member.member_type_id = MemberType.first.id
    if @member.save!
      flash[:notice] = "已成功建立會員資料"
      redirect_to member_path(@member)
    else
      flash[:alert] = @member.errors.full_messages.to_sentence
      render :new
    end
    
  end

  private

  def member_params
    params.require(:member).permit(
      :name,
      :gender,
      :birthday,
      :fax,
      :phone,
      :email,
      :hair_type_id,
      :skin_type_id,
      :info_way_id,
      :avatar)
  end
end
