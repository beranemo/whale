class Cashier::AgesController < Cashier::BaseController
  before_action :set_age, only: [:update, :destroy]

  def index
    @ages = Age.all
    @age = Age.new
  end
  
  def update
    if @age.update(age_params)
      redirect_to cashier_ages_path
      flash[:notice] = "年齡資料已更新"
    else
      @ages = Age.all
      render :index
    end
  end
  
  def create
    @age = Age.new(age_params)
    
    if @age.save
      flash[:notice] = "年齡資料已更新"
      redirect_to cashier_ages_path
    else
      @ages = Age.all
      render :index
    end
    
  end
  
  def destroy   
    if @age.destroy
      flash[:notice] = "年齡資料已刪除"
      redirect_to cashier_ages_path
    else
      @ages = Age.all
      render :index
    end
  end
  
  private
  def age_params
    params.require(:age).permit(:age_type)
  end
  
  def set_age
    @age = Age.find(params[:id])
  end  
end
