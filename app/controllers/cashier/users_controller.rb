class Cashier::UsersController < Cashier::BaseController
  
  before_action :authenticate_admin
  
  def index
    @users = User.group_by_cashier
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(users_params)
    @user.role = "cashier"
    @user.name = "新進人員"
    @user.password = "000000"
    if @user.save
      flash[:notice] = "成功新增門市人員帳號"
      redirect_to cashier_users_path
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :new
    end
  end
  
  def to_resigned
    @user = User.find(params[:id])
    @user.to_resigned
    
    redirect_to cashier_users_path
  end
  
  def to_in_service
    @user = User.find(params[:id])
    @user.to_in_service
    
    redirect_to cashier_users_path
  end  
  
  private
  def users_params
    params.require(:user).permit(
      :email
      )
  end
end
