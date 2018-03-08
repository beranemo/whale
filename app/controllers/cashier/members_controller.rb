class Cashier::MembersController < ApplicationController
  def index
    
  end

  def new
    @member = Member.new
  end
end
