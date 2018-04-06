require 'csv'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_cart

  layout :layout

  private

  def current_cart
    @cart || set_cart
  end

  def set_cart

    if session[:cart_id]
      @cart = Cart.find_by(id: session[:cart_id])
    end

    @cart ||= Cart.create

    session[:cart_id] = @cart.id
    @cart
  end

  def layout
  # 登入畫面關閉layout顯示
  is_a?(Devise::SessionsController) ? false : "application"
  end
end
