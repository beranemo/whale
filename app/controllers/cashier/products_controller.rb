class Cashier::ProductsController < ApplicationController
  def add_to_cart
    @product = Product.find(params[:id])
    @cart_item = current_cart.add_cart_item(@product)
    discount_method = DiscountMethod.find_by(content: "無")
    @cart_item.discount_method_id = discount_method.id
    @cart_item.save!
    
    if @cart_item.product.discount !=nil
      @bulletin = @cart_item.product.discount.bulletin
    else
      @bulletin = Bulletin.new
    end
    render :json => {:id => @product.id, :category => @product.category, :zh_name => @product.zh_name, :price => @product.price, :upc => @product.upc, :quantity => @cart_item.quantity,:bulletin => @bulletin.title}
  end
  
  
  def index
    @products = Product.all
  end
  
  def new
    
  end
  
  def manage
    @products = Product.all
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update(product2_params)
      flash[:notice] = "商品數量更新成功"
      redirect_to manage_cashier_products_path
    else
      flash.now[:alert] = @guest.errors.full_messages.to_sentence
      render :edit
    end
  end

  def import
    Product.update_by_file(params[:file])
    flash[:notice] = "成功匯入商品資訊"
    redirect_to cashier_products_path
  end
  
  private
  def product2_params
    params.require(:product).permit(:quantity)
  end
  
end
