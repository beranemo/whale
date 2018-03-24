class Cashier::DiscountMethodsController < ApplicationController
  before_action :set_discount_methods, only: [:update, :destroy]

  def index
    @discount_methods = DiscountMethod.all
    @discount_method = DiscountMethod.new
  end
  
  def update
    if @discount_method.update(discount_method_params)
      redirect_to cashier_discount_methods_path
      flash[:notice] = "商品折扣設定資料已更新"
    else
      @discount_methods = DiscountMethod.all
      render :index
    end
  end
  
  def create
    @discount_method = DiscountMethod.new(discount_method_params)
    
    if @discount_method.save
      flash[:notice] = "商品折扣設定資料已更新"
      redirect_to cashier_discount_methods_path
    else
      @discount_methods = DiscountMethod.all
      render :index
    end
    
  end
  
  def destroy   
    if @discount_method.destroy
      flash[:notice] = "商品折扣設定資料已更新"
      redirect_to cashier_discount_methods_path
    else
      @discount_methods = DiscountMethod.all
      render :index
    end
  end
  
  private
  def discount_method_params
    params.require(:discount_method).permit(:content)
  end
  
  def set_discount_methods
    @discount_method = DiscountMethod.find(params[:id])
  end 
end
