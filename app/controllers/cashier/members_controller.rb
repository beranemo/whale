class Cashier::MembersController < ApplicationController
  def index
    
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

  private

  def member_params
    params.require(:member).permit(:name,:gender,:birthday,
                                  :phone,:email,:skin,:hair,
                                  :avatar,:remark)
  end
end
