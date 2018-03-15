class Cashier::ProductsController < ApplicationController
  def add_to_cart
    @product = Product.find(params[:id])
    @cart_item = current_cart.add_cart_item(@product)
    
    @cart_item.save
    

    

    render :json => {:id => @product.id, :category => @product.category, :zh_name => @product.zh_name, :price => @product.price, :upc => @product.upc, :quantity => @cart_item.quantity}
  end
  
  
  def index
    @products = Product.all
  end
  
  def new
    
  end
  
  def manage
    @products = Product.all
  end

  def import
    Product.update_by_file(params[:file])
    flash[:notice] = "成功匯入商品資訊"
    redirect_to cashier_products_path
  end
end
