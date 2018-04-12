class Cashier::ProductsController < Cashier::BaseController
  def add_to_cart
    @product = Product.find(params[:id])
    if @product.zh_name == "折價卷"
      @cart_item = current_cart.cart_items.build(product_id: @product.id, discount_off: -params[:coupon_price].to_i)
      discount_method = DiscountMethod.find_by(content: "優惠價")
      @cart_item.discount_method_code = discount_method.code
      @cart_item.save!
      puts @cart_item.discount_off
      render :json => {:coupon_price => @cart_item.discount_off, :quantity => @cart_item.quantity }

    else
      @cart_item = current_cart.cart_items.build(product_id: @product.id)
      discount_method = DiscountMethod.find_by(content: "無")
      @cart_item.discount_method_code = discount_method.code
      @cart_item.save!
      
      
      render :json => {:id => @product.id, :category => @product.category, :zh_name => @product.zh_name,
                      :o_price => @product.price, :upc => @product.upc, :quantity => @cart_item.quantity,
                      }
    end
  end
  
  def barcode_to_cart
    @product = Product.find_by(upc: params[:barcode])
    puts @product.upc
    if @product == nil
      render :json => @product
    elsif @product.status == "removed" # 如果是停用不要加
      @product = nil
      render :json => @product
    else
      @cart_item = current_cart.cart_items.build(product_id: @product.id)
      discount_method = DiscountMethod.find_by(content: "無")
      @cart_item.discount_method_code = discount_method.code
      @cart_item.save!

      render :json => {:id => @product.id, :category => @product.category, :zh_name => @product.zh_name,
                      :o_price => @product.price, :upc => @product.upc, :quantity => @cart_item.quantity,
                      :discount_method_code => discount_method.code}
    end
      
  end
  
  def index
    @products = Product.where.not(id:1)
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    
    if @product.save
      flash[:notice] = "商品資料已成功更新"
      redirect_to cashier_products_path
    else
      render :index
    end
  end
  
  def removed_list
    @products = Product.where.not(id:1).order(created_at: :desc)
  end
  
  def remove
    @product = Product.find(params[:id])
    @product.status = "removed"
    @product.save
    flash[:notice] = "商品停用成功"
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end
  
  def listing
    @product = Product.find(params[:id])
    @product.status = "listing"
    @product.save
    flash[:notice] = "商品上架成功"
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end
  
  def manage
    @products = Product.where.not(id:1)
  end
  
  def show
    @product = Product.find(params[:id])
  end
    
  def update_all
    @products = Product.all
    datas = params[:products]
    @products.each do |product|
      if datas[product.id.to_s] != nil
        product.quantity += datas[product.id.to_s][:quantity].to_i
        stock_record = product.stock_records.build(quantity: datas[product.id.to_s][:quantity].to_i)
        stock_record.save!
        product.save!
      end
    end
    flash[:notice] = "商品數量批次更新成功"
    redirect_to manage_cashier_products_path
  end
  
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "商品資料更新成功"
      redirect_to cashier_products_path
    else
      flash.now[:alert] = @guest.errors.full_messages.to_sentence
      render :edit
    end
  end
  
  def import_xlsx_new
  end

  def import_xlsx
    Product.update_by_file(params[:file])
    flash[:notice] = "成功匯入商品資訊"
    redirect_to cashier_products_path
  end
  
  private
  def product_quantity_params
    params.require(:product).permit(:quantity)
  end
  
  def product_params
    params.require(:product).permit(
      :category,
      :zh_name,
      :en_name,
      :capacity,
      :price,
      :upc,
      :use_for,
      :directions,
      :zh_m_ingredients,
      :zh_ingredients,
      :en_ingredients,
      :quantity
      )
  end
  
end
