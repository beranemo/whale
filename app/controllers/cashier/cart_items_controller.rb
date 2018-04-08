class Cashier::CartItemsController < Cashier::BaseController
  
  def plus_quantity
    @cart_item = current_cart.cart_items.where(product_id: params[:id])[params[:item_index].to_i]
    @l_price = @cart_item.calculate.round#上次金額
    @cart_item.quantity+=1
    @o_price = @cart_item.origin_calculate.round#小計金額
    @cart_item.save!
    @d_price = @cart_item.calculate.round
    puts @o_price
    puts @l_price
    puts @d_price
    render :json => {:id =>params[:id] , :quantity => @cart_item.quantity, :l_price => @l_price,
                    :v_price => @o_price - @d_price, :o_price => @o_price, :d_price => @d_price,
                    :item_index => params[:item_index]}
  end


  def minus_quantity
    @cart_item = current_cart.cart_items.where(product_id: params[:id])[params[:item_index].to_i]
    
    if @cart_item.quantity>0
      @l_price = @cart_item.calculate.round#上次金額
      @cart_item.quantity -=1
      @o_price = @cart_item.origin_calculate.round#小計金額
      @d_price = @cart_item.calculate.round

      @cart_item.save!
      

      render :json => {:id =>params[:id] , :quantity => @cart_item.quantity, :l_price => @l_price,
                    :v_price => @o_price - @d_price, :o_price => @o_price, :d_price => @d_price,
                    :item_index => params[:item_index], :success => "1"}
    else
      render :json => {:success => "0"}
    end
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
    @o_price = @cart_item.origin_calculate.round#小計金額
    @l_price = @cart_item.calculate.round#上次金額
    @cart_item.discount_method_code = params[:method_code]
    @cart_item.discount_off = params[:discount]

    @d_price = @cart_item.calculate.round#計算打折後金額
    @cart_item.save!
    

    puts @cart_item.discount_method.content
    puts @o_price
    puts @l_price
    puts @d_price
    puts params[:item_index]
    render :json => {:id => params[:id], :l_price => @l_price, :d_price => @d_price,
                    :v_price => (@o_price - @d_price ), :o_price => @o_price, discount_off: params[:discount],
                    :item_index => params[:item_index]}
  end

  def destroy
    @cart_item = current_cart.cart_items.where(product_id: params[:id])[params[:item_index].to_i]
    @price = @cart_item.calculate.round
    @cart_item.destroy
    render :json => {:id =>params[:id], :item_index => params[:item_index], :o_price => -@price}
  end
end
