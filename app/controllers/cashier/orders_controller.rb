class Cashier::OrdersController < ApplicationController
  def index
    @orders = Order.all

  end

  def edit
    
    @order = Order.find(params[:id])
    if current_user.id != @order.user_id
      flash[:alert] = "結帳人員不符"
      redirect_to cashier_orders_path

    end
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
      @member =  order_params[:member_id]=="-1" ? Member.new(id: -1) : Member.find(order_params[:member_id])
      @order =Order.new(member_id: params[:id])
      @order.amount = 0
      redirect_to new_cashier_order_path(id: -1)
    else
      @order = current_user.orders.build(order_params)
  
      @order.amount =0
      current_cart.cart_items.each do |item|
        product = item.product
        product.quantity -= item.quantity
        if product.quantity < 0
          redirect_to new_cashier_order_path(id: -1)
          flash[:alert] = "#{product.zh_name}數量不足"
          return 
        end
        stock_record = product.stock_records.build(quantity: -item.quantity,order_id: @order.id)
        stock_record.save!
        order_item = @order.order_items.build(product_id: item.product.id, price: item.product.price, quantity: item.quantity)
             
        @order.amount += item.product.price * item.quantity
        order_item.save!
        product.save!
      end
      if @order.save
        
        session[:cart_id] = nil
        redirect_to new_cashier_order_path(id: -1)
        flash[:notice] = "成功成立訂單"
      else
        flash[:alert] = @order.errors.full_messages.to_sentence
        redirect_to new_cashier_order_path(id: order_params[:member_id])
      end

      
    end
    
  end

  private

  def order_params
    params.require(:order).permit(:member_id, :payment_method, :address)
  end
  
end
