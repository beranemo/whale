class Cashier::DiscountsController < ApplicationController
  def new
    @discount = Discount.new
  end
end
