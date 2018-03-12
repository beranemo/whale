class Cashier::OrdersController < ApplicationController

  def new
    
    @products = Product.all 
    @order_items = current_order.order_items.all
    if params[:id] != "-1"
      set_order(params[:id])
      @member = Member.find(params[:id])
    else
      @member = Member.new
    end
  end

  def create
    if current_order.order_items.size ==0
      flash[:alert] = "訂單內容不能是空的"
      @products = Product.all 
      @order_items = current_order.order_items.all
      @member = current_order.member_id ? 
                 Member.new : Member.find(current_order.member_id)
      render :new
    else
      session[:order_id] = nil
      redirect_to new_cashier_orders_path(id: -1)
    end
    
  end
end
