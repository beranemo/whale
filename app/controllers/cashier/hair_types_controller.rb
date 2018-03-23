class Cashier::HairTypesController < Cashier::BaseController

  before_action :set_hair, only: [:update, :destroy]

  def index
    @hairs = HairType.all
    @hair = HairType.new
  end
  
  def update
    if @hair.update(hair_params)
      redirect_to cashier_hair_types_path
      flash[:notice] = "髮質資料已更新"
    else
      @hairs = HairType.all
      render :index
    end
  end
  
  def create
    @hair = HairType.new(hair_params)
    
    if @hair.save
      flash[:notice] = "髮質內容已成功新增"
      redirect_to cashier_hair_types_path
    else
      @hairs = HairType.all
      render :index
    end
    
  end
  
  def destroy   
    if @hair.destroy
      flash[:notice] = "髮質內容已成功刪除"
      redirect_to cashier_hair_types_path
    else
      @hairs = HairType.all
      render :index
    end
  end
  
  private
  def hair_params
    params.require(:hair_type).permit(:value)
  end
  
  def set_hair
    @hair = HairType.find(params[:id])
  end
  
end
