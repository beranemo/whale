class Cashier::HairTypesController < ApplicationController
  def index
    @hairs = HairType.all
  end
end
