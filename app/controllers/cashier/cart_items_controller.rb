class Cashier::CartItemsController < ApplicationController
  def plus_quantity
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    @cart_item.quantity+=1
    @cart_item.save!
    render :json => {:id =>params[:id] , :quantity => @cart_item.quantity, :price => @cart_item.product.price}
  end


  def minus_quantity
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    
    if @cart_item.quantity>0
      @cart_item.quantity -=1
      @cart_item.save!
      render :json => {:id =>params[:id] , :quantity => @cart_item.quantity, :price => @cart_item.product.price}
    else
      render :json => {:id =>params[:id] , :quantity => 0 ,:price => 0}
    end
  end


  def destroy
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    @price = @cart_item.product.price
    @cart_item.destroy
    render :json => {:id =>params[:id], :price => @price}
  end
end
