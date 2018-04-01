class Cashier::GuestTypesController < Cashier::BaseController
  before_action :set_guest, only: [:update, :destroy]

  def index
    @guests = GuestType.all
    @guest = GuestType.new
  end
  
  def edit
    @guest = GuestType.find(params[:id])
  end
  
  def update
    if @guest.update(guest_params)
      redirect_to cashier_guest_types_path
      flash[:notice] = "客戶類型資料已更新"
    else
      @guests = GuestType.all
      render :index
    end
  end
  
  def create
    @guest = GuestType.new(guest_params)
    
    if @guest.save
      flash[:notice] = "客戶類型內容已成功新增"
      redirect_to cashier_guest_types_path
    else
      @guests = GuestType.all
      render :index
    end
    
  end
  
  def destroy   
    if @guest.destroy
      flash[:notice] = "客戶類型內容已成功刪除"
      redirect_to cashier_guest_types_path
    else
      @guests = GuestType.all
      render :index
    end
  end
  
  private
  def guest_params
    params.require(:guest_type).permit(:guest_type)
  end
  
  def set_guest
    @guest = GuestType.find(params[:id])
  end

end
