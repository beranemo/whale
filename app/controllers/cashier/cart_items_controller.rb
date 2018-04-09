class Cashier::CartItemsController < Cashier::BaseController
  
  def plus_quantity
    @cart_item = current_cart.cart_items.where(product_id: params[:id])[params[:item_index].to_i]
    @prev_price = @cart_item.calculate.round
    
    @cart_item.quantity+=1
    @origin_price = @cart_item.origin_calculate.round
    @discounted_price = @cart_item.calculate.round
    @varied_price = @origin_price - @discounted_price

    @cart_item.save!
    render :json => {:id =>params[:id] , :quantity => @cart_item.quantity, :l_price => @prev_price,
                    :v_price => @varied_price, :o_price => @origin_price, :d_price => @discounted_price,
                    :item_index => params[:item_index]}
  end


  def minus_quantity
    @cart_item = current_cart.cart_items.where(product_id: params[:id])[params[:item_index].to_i]
    @prev_price = @cart_item.calculate.round
    
    @cart_item.quantity -=1
    @origin_price = @cart_item.origin_calculate.round
    @discounted_price = @cart_item.calculate.round
    @varied_price = @origin_price - @discounted_price
    @cart_item.save!
    

    render :json => {:id =>params[:id] , :quantity => @cart_item.quantity, :l_price => @prev_price,
                  :v_price => @varied_price, :o_price => @origin_price, :d_price => @discounted_price,
                  :item_index => params[:item_index]}

  end

  def clear_coupon
    
    @coupons = current_cart.cart_items.where("product_id = ?",params[:id])
    @coupons.destroy_all
    render  :json => {:success => "0"}
  end

  def clear_cart
    current_cart.cart_items.destroy_all  
  end

  def edit
    
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    render :layout => false
  end

  def add_discount
    @cart_item = current_cart.cart_items.where(product_id: params[:id])[params[:item_index].to_i]
    quantity = @cart_item.quantity
    @prev_price = @cart_item.calculate.round
    @origin_price = @cart_item.origin_calculate.round
    @cart_item.discount_method_code = params[:method_code]
    @cart_item.discount_off = params[:discount]
    @discounted_price = @cart_item.calculate.round
    @varied_price = @origin_price - @discounted_price
    @cart_item.save!
    
    render :json => {:id => params[:id], :l_price => @prev_price, :d_price => @discounted_price,
                    :v_price => @varied_price, :o_price => @origin_price, discount_off: params[:discount],
                    :item_index => params[:item_index]}
  end

  def destroy
    @cart_item = current_cart.cart_items.where(product_id: params[:id])[params[:item_index].to_i]
    @price = @cart_item.calculate.round
    @cart_item.destroy
    render :json => {:id =>params[:id], :item_index => params[:item_index], :o_price => -@price}
  end
end
