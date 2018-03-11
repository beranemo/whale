class Cashier::OrderItemsController < ApplicationController
  def destroy
    @order_item = current_order.order_items.find_by(product_id: params[:id])
    @order_item.destroy
    render :json => {:id =>params[:id]}
  end
end
