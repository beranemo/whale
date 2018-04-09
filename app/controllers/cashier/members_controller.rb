class Cashier::MembersController < Cashier::BaseController


  def index
    @members = Member.all.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.csv { send_data(@members.to_csv) }
    end
  end

  def show
    @member = Member.find(params[:id])  
  end
  
  def show_orders
    @member = Member.find(params[:id])
    @orders =@member.orders
  end

  def import
    Member.update_by_file(params[:file])
    flash[:notice] = "成功匯入會員資料"
    redirect_to cashier_members_path
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save!
      flash[:notice] = "成功新增會員"
      redirect_to cashier_member_path(@member)
    else
      flash[:alert] = @member.errors.full_messages.to_sentence
      render :new
    end
  end
  
  def create_successfully
    @member = Member.find(params[:id])
  end
  
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:notice] = "成功更新會員資料"
      redirect_to cashier_member_path(@member)
    else
      flash.now[:alert] = @member.errors.full_messages.to_sentence
      render :edit
    end
  end

  def search
    
  end
  
  def birthday_this_month
    temp = Member.all
    @members = temp.group_by{ |t| t.birthday.month == DateTime.now.month }
  end
  
  def birthday_next_month
    temp = Member.all    
    @members = temp.group_by{ |t| t.birthday.month == DateTime.now.month + 1 }
  end

 
  def search_outcome
    puts params[:phone]
    
    key_word = ''
    if params[:phone] != nil
      key_word = params[:phone]
      @members = Member.where("phone like ? OR email LIKE ? OR name LIKE ?", "%"+key_word+"%", "%"+key_word+"%", "%"+key_word+"%")      
#    elsif params[:email] != nil
#      key_word = params[:email]
#      @members = Member.where("email like ?", "%"+key_word+"%")
#      puts @members
#    else
      
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
      :fax,
      :member_type_id,
      :email,
      :skin_type_id,
      :hair_type_id,
      :info_way_id,
      :avatar,
      :remark
      )
  end
end
