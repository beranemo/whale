class Cashier::SkinTypesController < ApplicationController

  before_action :set_skin, only: [:update, :destroy]

  def index
    @skins = SkinType.all
    @skin = SkinType.new
  end
  
  def update
    if @skin.update(skin_params)
      redirect_to cashier_skin_types_path
      flash[:notice] = "膚質資料已更新"
    else
      @skins = SkinType.all
      render :index
    end
  end
  
  def create
    @skin = SkinType.new(skin_params)
    
    if @skin.save
      flash[:notice] = "膚質內容已成功新增"
      redirect_to cashier_skin_types_path
    else
      @skins = SkinType.all
      render :index
    end
    
  end
  
  def destroy   
    if @skin.destroy
      flash[:notice] = "膚質內容已成功刪除"
      redirect_to cashier_skin_types_path
    else
      @skins = SkinType.all
      render :index
    end
  end
  
  private
  def skin_params
    params.require(:skin_type).permit(:value)
  end
  
  def set_skin
    @skin = SkinType.find(params[:id])
  end
  
end
