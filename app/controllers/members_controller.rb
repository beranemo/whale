class MembersController < ApplicationController
  def indx
    
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save!
      flash[:notice] = "成功加入會員"
      redirect_to root_path
    else
      flash[:alert] = @member.errors.full_messages.to_sentence
      render :new
    end
    
  end

  private

  def member_params
    params.require(:member).permit(:name,:gender,:birthday,:phone,:email,:skin,:hair,:avatar)
  end
end
