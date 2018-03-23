class Cashier::DiscountsController < Cashier::BaseController
  def new
    @discount = Discount.new(bulletin_id: params[:bulletin_id])
  end

  def create
    @discount = Discount.new(discount_params)
    if @discount.save
      flash[:notice] = "商品折扣新增成功"      
    else
      flash[:alert] = @discount.errors.full_messages.to_sentence
    end
    redirect_to cashier_bulletins_path
  end

  private

  def discount_params
    params.require(:discount).permit(:bulletin_id, :discount_method_id, :product_id)
  end
end
