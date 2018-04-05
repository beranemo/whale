class Cashier::SettingsController < Cashier::BaseController
  before_action :authenticate_admin

  def index
    @settings = Setting.all
  end
  
  def edit
    @setting = Setting.find(params[:id])
  end
  
  def update
    @setting = Setting.find(params[:id])
    if @setting.update(setting_params)
      redirect_to cashier_settings_path
      flash[:notice] = "資料已更新"
    else
      @settings = Setting.all
      render :index
    end
  end
  
  def create
    @setting = Setting.new(setting_params)
    
    if @setting.save
      flash[:notice] = "內容已成功新增"
      redirect_to cashier_settings_path
    else
      @settings = Setting.all
      render :index
    end
    
  end
  
  def destroy   
    if @setting.destroy
      flash[:notice] = "內容已成功刪除"
      redirect_to cashier_settings_path
    else
      @settings = Setting.all
      render :index
    end
  end
  
  private
  def setting_params
    params.require(:setting).permit(:code, :content)
  end  
end
