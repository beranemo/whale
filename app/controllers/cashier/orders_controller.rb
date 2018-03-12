class Cashier::OrdersController < ApplicationController

  def new
    puts session[:order_id]
    @products = Product.all
    if session[:order_id]
      @order = Order.find(session[:order_id])
      @order_items = current_order.order_items.all
    end 
    
    if params[:id] != "-1"
      set_order(params[:id])
      @member = Member.find(params[:id])
    else
      @member = Member.new
    end
  end
end
