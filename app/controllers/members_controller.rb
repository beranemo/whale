class MembersController < ApplicationController
  def indx
    
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
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
      :phone,
      :email,
      :hair_code,
      :skin_type_id,
      :avatar)
  end
end
