class Cashier::CartItemsController < ApplicationController
  def plus_quantity
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    @o_price = @cart_item.calculate.round
    puts @o_price
    @cart_item.quantity+=1
    @cart_item.save!
    @price = @cart_item.calculate.round
    puts @price
    render :json => {:id =>params[:id] , :quantity => @cart_item.quantity, :price =>@price -@o_price}
  end


  def minus_quantity
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    
    if @cart_item.quantity>0
      @o_price = @cart_item.calculate.round
      @cart_item.quantity -=1
      @price = @cart_item.calculate.round

      @cart_item.save!
      

      render :json => {:id =>params[:id] , :quantity => @cart_item.quantity, :price => @price -@o_price}
    else
      render :json => {:id =>params[:id] , :quantity => 0 ,:price => 0}
    end
  end


  def destroy
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    @price = @cart_item.product.price * @cart_item.quantity
    @cart_item.destroy
    render :json => {:id =>params[:id], :minus_price => @price}
  end
end
