class Cashier::CountriesController < Cashier::BaseController
  before_action :set_country, only: [:update, :destroy]

  def index
    @countries = Country.all.order(system_flag: :asc)
    #@country = Country.new
  end
  
  def update
    if @country.update(country_params)
      redirect_to cashier_countries_path
      flash[:notice] = "國家設定資料已更新"
    else
      @countries = Country.all
      render :index
    end
  end
  
  def remove
    @country = Country.find(params[:id])
    @country.is_active = false
    @country.save
    flash[:notice] = "停用國家成功"
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end
  
  def listing
    @country = Country.find(params[:id])
    @country.is_active = true
    @country.save
    flash[:notice] = "國家已啓用成功"
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end
  
  def create
    @country = Country.new(country_params)
    
    if @country.save
      flash[:notice] = "國家設定資料已更新"
      redirect_to cashier_countries_path
    else
      @countries = Country.all
      render :index
    end
    
  end
  
  def destroy   
    if @country.destroy
      flash[:notice] = "國家設定資料已更新"
      redirect_to cashier_countries_path
    else
      @countries = Country.all
      render :index
    end
  end
  
  private
  def country_params
    params.require(:country).permit(:country_type)
  end
  
  def set_country
    @country = Country.find(params[:id])
  end  
end
