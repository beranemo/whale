class Cashier::CartItemsController < ApplicationController
  def destroy
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    @price = @cart_item.product.price
    @cart_item.destroy
    render :json => {:id =>params[:id], :price => @price}
  end
end
