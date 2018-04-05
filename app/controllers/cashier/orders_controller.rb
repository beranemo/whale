class Cashier::OrdersController < Cashier::BaseController
  before_action :set_order, only: [:show, :pick_up, :edit, :set_member, :update,
                                   :new_guest, :create_guest]
  
  before_action :authenticate_admin, only: [:index]


  Item_Data = Struct.new(:name, :quantity)#分析訂單商品時用來存的object type

  def index
    @orders = Order.all.order(:created_at)
  end

  def today
    @orders = Order.where("created_at >= ?", Time.zone.now.beginning_of_day).order(created_at: :desc)
  end

  def not_pick
    @orders = Order.where(status: false).order(created_at: :desc)
  end

  def pick_up
    @order = Order.find(params[:id])
    @order.order_items.each do |item|
      product = item.product
      product.quantity -= item.quantity
      if product.quantity <= 0
        flash[:alert] = "商品庫存數量錯誤"
      end

      stock_record = product.stock_records.build(quantity: -item.quantity,order_id: @order.id)
      stock_record.save!
    end
    @order.status = true
    @order.save!
    flash[:notice] = "訂單取貨成功"
    redirect_to not_pick_cashier_orders_path
  end

  def new_guest
    @guest = Guest.new
    if @order.member
      @guest.gender = @order.member.gender
      @guest.guest_type_id = GuestType.find_by(guest_type: "舊客").id
    else
      @guest.guest_type_id = GuestType.find_by(guest_type: "新客").id
      @guest.gender = "男"
    end
  end

  def create_guest
    @guest = Guest.new(guest_params)
    @guest.user_id = current_user.id
    @guest.save!

    @order.guest_id = @guest.id
    @order.save!
    flash[:notice] = "訂單新增客情成功"
    redirect_to today_cashier_orders_path
  end

  def edit

    @order_items = @order.order_items
    current_cart.cart_items.destroy_all
    @order_items.each do |item|
      @cart_item = current_cart.cart_items.build(product_id: item.product.id, quantity: item.quantity)
      @cart_item.discount_off = item.price
      discount_method = DiscountMethod.find_by(content: "優惠價")
      @cart_item.discount_method_code = discount_method.code
      @cart_item.save!
    end

    @index_hash = Hash.new(0)
    @coupon = Product.find_by(zh_name: "折價卷")
    @cart_coupons = current_cart.cart_items.where('product_id = ?', @coupon.id)
    @cart_items = current_cart.cart_items.where('product_id != ?', @coupon.id)
    @products = Product.where('id != ?',@coupon.id) 
    @coupon_discount = 0
    @cart_coupons.each do |c|
      @coupon_discount += c.discount_off
    end
    @order.amount -= @coupon_discount
    if params[:member_id] != nil
      @member = Member.find(params[:member_id])
      @order.name = @member.name
      @order.phone = @member.phone
      
    elsif @order.member_id != -1
      @member = Member.find(@order.member_id)
    else
      @member = Member.new(id: -1)
    end
  end


  def show
    @coupon = Product.find_by(zh_name: "折價卷")
    @order_items = @order.order_items.where("product_id != ?",@coupon.id)
    @origin_amount = 0
    @order_counts = Order.where("member_id = ?",@order.member_id).count

    @cart_coupons = @order.order_items.where('product_id = ?',@coupon.id)
    @coupon_discount = 0
    @cart_coupons.each do |c|
      @coupon_discount += c.price
    end
  end


  def set_member  
    

  end

  def new
    @order = Order.new(member_id: params[:id])
    @coupon = Product.find_by(zh_name: "折價卷")
    @index_hash = Hash.new(0)
    @order.amount = 0
    @order.discount_off = 100
    @products = Product.where('id != ?',@coupon.id) 
    @cart_items = current_cart.cart_items.where('product_id != ?', @coupon.id)
    @cart_coupons = current_cart.cart_items.where('product_id = ?', @coupon.id)
    @coupon_discount = 0
    @cart_coupons.each do |c|
      @coupon_discount += c.discount_off
    end

    if params[:id] != "-1"
      @member = Member.find(params[:id])
      @order.name = @member.name
      @order.phone = @member.phone
      
    else
      @member = Member.new(id: -1)
    end

  end

  def update
    #復原原本訂單扣的庫存
    @order.order_items.each do |item|
      product = item.product
      if product.zh_name != "折價卷" && @order.status && @order.address == "自取"
        product.quantity += item.quantity
        product.save!
      end
      
    end

    if @order.update(order_params)
      current_cart.cart_items.each do |item|
        product = item.product
        if product.zh_name != "折價卷" && @order.status && @order.address == "自取"
          product.quantity -= item.quantity
          if product.quantity <= 0
            flash[:alert] = "商品庫存數量錯誤."
          end

          stock_record = product.stock_records.find_by(order_id: @order.id)
          if stock_record == nil
            stock_record = product.stock_records.build(quantity: -item.quantity,order_id: @order.id)
          else
            stock_record.quantity -= item.quantity
          end
          stock_record.save!
        end
        
        order_item = @order.order_items.find_by(product_id: item.product.id)
        if order_item == nil
          order_item = @order.order_items.build(product_id: item.product.id, price: item.calculate, quantity: item.quantity)
        else
          order_item.update(price: item.calculate, quantity: item.quantity)
        end
        
        order_item.save!
        product.save!
      end
      
      @order.status =  (@order.status || @order.address != "自取")
      flash[:notice] = "成功更新訂單記錄"
      redirect_to cashier_order_path(@order.id)
    else
      flash[:alert] = @guest.errors.full_messages.to_sentence
      
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
      today = Date.today.to_s
      today.slice!("2")
      today_order_count = Order.where("created_at >= ?", Time.zone.now.beginning_of_day).count
      @order.sn = today.tr('-','').to_i * 1000 + today_order_count + 1
      current_cart.cart_items.each do |item|
        product = item.product
        if product.zh_name != "折價卷" && @order.status && @order.address == "自取"
          product.quantity -= item.quantity
          if product.quantity <= 0
            flash[:alert] = "商品庫存數量錯誤."
          end

          stock_record = product.stock_records.find_by(order_id: @order.id)
          if stock_record == nil
            stock_record = product.stock_records.build(quantity: -item.quantity,order_id: @order.id)
          else
            stock_record.quantity -= item.quantity
          end
          stock_record.save!
        end


        order_item = @order.order_items.build(product_id: item.product.id, price: item.calculate, quantity: item.quantity)
        order_item.save!
        product.save!
      end
      
      @order.status =  (@order.status || @order.address != "自取")
      if @order.save
        session[:cart_id] = nil
        #當訂單為宅配時寄信通知倉庫
        if @order.address != "自取"
          UserMailer.notify_order_deliver(@order).deliver_now!
        end
        flash[:notice] = "成功成立訂單"
        redirect_to new_guest_cashier_order_path(@order)
      else
        flash[:alert] = @order.errors.full_messages.to_sentence
        redirect_to new_cashier_order_path(id: order_params[:member_id])
      end

      
    end
    
  end


  def sales_analysis_day
  end

  
  def search_outcome
    if params[:type] == "period"
      s_date = Date.parse(params[:s_date]).to_time
      e_date = Date.parse(params[:e_date]).to_time
      # puts s_date # 有需要再打開
      # puts e_date # 有需要再打開
      @orders = Order.where(created_at: s_date.beginning_of_day..e_date.end_of_day).order(created_at: :asc)

      order_amount_arr = []
      @members = {}
      @orders.each do |order|
        order_amount = order.amount
        order_amount_arr.push(order_amount)
        if order.member
          @members[order.id] = order.member.name
        end
        # puts order_amount_arr # 有需要再打開
      end
      @total_amount = order_amount_arr.inject(0){|order_amount_arr,x| order_amount_arr + x }

      @users = []
      
      @orders.each do |order|
      @users  << order.user.name

      end

      # ranking_day 銷售排行 - 日期銷售
      total = @orders.sort_by {  |s| s.created_at.to_s[5..9] }
      day_amount_arr = total.pluck(:created_at, :amount)

      day_amount_hash = Hash.new(0)
      day_amount_arr.each {|key, value| day_amount_hash[key.to_s[5..9].tr('-','/')] += value}
      @arr_x = day_amount_hash.keys
      @arr_y = day_amount_hash.values

      day_order_arr = total.pluck(:created_at, :id)
      day_order_hash = Hash.new(0)
      day_order_arr.each {|key, value| day_order_hash[key.to_s[5..9]] += 1 }
      @arr_y2 = day_order_hash.values

      render :json => {:orders => @orders, :total_amount => @total_amount,:members => @members, :users => @users, :arr_x => @arr_x, :arr_y => @arr_y, :arr_y2 => @arr_y2}

    else
      date = Date.parse(params[:created_at]).to_time
      # puts date # 有需要再打開
      @orders = Order.where(created_at: date.beginning_of_day..date.end_of_day)
      
      
      @orders_hash ={}
      @members = {}
      @orders.each do |order|
        
        order_items_hash = {}
        order.order_items.each do |item|
          if order_items_hash[item.product.id]

            order_items_hash[item.product.id].quantity += item.quantity
          else
            order_items_hash[item.product.id] =  Item_Data.new(item.product.zh_name, item.quantity)
          end
          if order.member
            @members[order.id] = order.member.name
          end
        end
        @orders_hash[order.id] = order_items_hash
      end

      @users = Array.new()
      @orders.each do |order|
      @users  << order.user.name
      end

      order_amount_arr = []
      @orders.each do |order|
      order_amount = order.amount
      order_amount_arr.push(order_amount)
      # puts order_amount_arr # 有需要再打開
      end
      @total_amount = order_amount_arr.inject(0){|order_amount_arr,x| order_amount_arr + x }
      
      render :json => {:orders => @orders, :orders_hash => @orders_hash, :members => @members, :users =>@users, :total_amount => @total_amount}
    end
  end
      

  def sales_analysis_statement
  end


  def ranking_product
    date = Date.today.all_month
    @orders = Order.where(created_at: date)

    order_item_arr = []
    @orders.each do |order|
      order_items = order.order_items

      order_item_arr.concat(order_items)
      # puts order_item_arr # 有需要再打開
    end
    total = order_item_arr.delete_if {|k| k.product_id == 1 }.sort_by { |k| k["product_id"] }
    total_uni = total.uniq{|t| t["product_id"]}

    product_quantity_arr = total.pluck(:product_id, :quantity).sort!
    order_item_hash = Hash.new(0)
    product_quantity_arr.each {|key, value| order_item_hash[key] += value}

    # puts order_item_hash # 有需要再打開

    product_id_ranking_arr = order_item_hash.sort_by{ |k, v| v }.reverse.transpose.first
    @product_quantity = order_item_hash.sort_by{ |k, v| v }.reverse.transpose.last
    @product_ranking = total_uni.sort_by {|e| product_id_ranking_arr.index(e.product_id) }

    # chart
    @products = Array.new()
    total_uni.each do |order|
    @products  << order.product.zh_name
    @products.delete_if {|k| k.to_s == "折價卷" } 
    
    # puts @products # 有需要再打開
    end

    @y = order_item_hash.sort_by{ |k, v| k }.transpose.last
  end

  def ranking_user
    date = Date.today.all_month
    @orders = Order.where(created_at: date)

    total = @orders.sort_by { |k| k["user_id"] }
    total_uni = total.uniq{|t| t["user_id"]}

    user_amount_arr = total.pluck(:user_id, :amount).sort!
    order_user_hash = Hash.new(0)
    user_amount_arr.each {|key, value| order_user_hash[key] += value}
    # puts @order_user_hash # 有需要再打開

    user_id_ranking_arr = order_user_hash.sort_by{ |k, v| v }.reverse.transpose.first
    @user_amount = order_user_hash.sort_by{ |k, v| v }.reverse.transpose.last
    @user_ranking = total_uni.sort_by {|e| user_id_ranking_arr.index(e.user_id) }
  
  # chart
    @users = Array.new()
    total_uni.each do |order|
    @users  << order.user.name

    # puts @users # 有需要再打開
    end

    @y = order_user_hash.sort_by{ |k, v| k }.transpose.last
  end

  def ranking_hour
    @orders = Order.where("created_at >= ?", Time.zone.now.beginning_of_day)
    total = @orders.sort_by {  |s| s.created_at.hour }
    hour_amount_arr = total.pluck(:created_at, :amount)

    @hour_amount_hash = Hash.new(0)
    hour_amount_arr.each {|key, value| @hour_amount_hash[key.hour] += value}
    # puts @hour_amount_hash # 有需要再打開

    @arr_x = [10,11,12,13,14,15,16,17,18,19,20,21,22]
    @arr_y = [0,0,0,0,0,0,0,0,0,0,0,0,0]
    @arr_y2 = [0,0,0,0,0,0,0,0,0,0,0,0,0]
  end

  def ranking_day
    
  end

  private

  def order_params
    params.require(:order).permit(
      :member_id, 
      :payment_method, 
      :address,
      :phone, 
      :name, 
      :remark,
      :amount, 
      :discount_off, 
      :status,
      :user_id, 
      :created_at
      )
  end
  
  def guest_params
    params.require(:guest).permit(
      :payment, 
      :gender, 
      :guest_type_id, 
      :country_id, 
      :age_id, 
      :info_way_id, 
      :user_id, 
      :remark
      )
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
