class Cashier::CartItemsController < ApplicationController
  
  def plus_quantity
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    @l_price = @cart_item.calculate.round#上次金額
    @cart_item.quantity+=1
    @o_price = @cart_item.origin_calculate.round#小計金額
    @cart_item.save!
    @d_price = @cart_item.calculate.round
    puts @o_price
    puts @l_price
    puts @d_price
    render :json => {:id =>params[:id] , :quantity => @cart_item.quantity, :price => @l_price,
                    :v_price => @o_price - @d_price, :o_price => @o_price, :d_price => @d_price}
  end


  def minus_quantity
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    
    if @cart_item.quantity>0
      @l_price = @cart_item.calculate.round#上次金額
      @cart_item.quantity -=1
      @o_price = @cart_item.origin_calculate.round#小計金額
      @d_price = @cart_item.calculate.round

      @cart_item.save!
      

      render :json => {:id =>params[:id] , :quantity => @cart_item.quantity, :price => @l_price,
                    :v_price => @o_price - @d_price, :o_price => @o_price, :d_price => @d_price}
    else
      render :json => {:id =>params[:id] , :quantity => 0 ,:price => 0}
    end
  end

  def edit
    
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    render :layout => false
  end

  def add_discount
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
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

    render :json => {:id => params[:id], :price => @l_price, :d_price => @d_price,
                    :v_price => (@o_price - @d_price ), discount_off: params[:discount]}
  end

  def destroy
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    @price = @cart_item.calculate.round
    @cart_item.destroy
    render :json => {:id =>params[:id], :price => @price}
  end
end
