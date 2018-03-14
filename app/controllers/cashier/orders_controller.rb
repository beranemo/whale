class Cashier::OrdersController < ApplicationController
  def index
    @orders = Order.all
    
  end

  def new
    @order =Order.new(member_id: params[:id])
    @order.amount = 0
    @products = Product.all 
    @cart_items = current_cart.cart_items.all
    if params[:id] != "-1"
      
      @member = Member.find(params[:id])
    else
      @member = Member.new(id: -1)
    end
  end

  def create
    if current_cart.cart_items.size ==0
      flash[:alert] = "訂單內容不能是空的"
      @products = Product.all 
      @cart_items = current_cart.cart_items.all
      @member =  Member.find(params[:member_id])
      render :new
    else
      @order = current_user.orders.build(member_id: params[:member_id])
      @order.amount =0
      current_cart.cart_items.each do |item|
        order_item = @order.order_items.build(product_id: item.product.id, price: item.product.price, quantity: item.quantity)
        @order.amount += item.product.price * item.quantity
        order_item.save!
      end
      @order.save!
      session[:cart_id] = nil
      redirect_to new_cashier_order_path(id: -1)
    end
    
  end


  
end
