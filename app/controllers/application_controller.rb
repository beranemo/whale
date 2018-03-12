class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_order

  private

  
  
  def current_order
    @order || set_order(-1)
  end

  def set_order(id)       
    if session[:order_id]
      puts session[:order_id]
      @order = Order.find_by(id: session[:order_id])
      @order.member_id = id      
    else
      @order = current_user.orders.create(member_id: id)
    end

 
    @order.save!
    session[:order_id] = @order.id
    @order
  end

end
