class ApplicationController < ActionController::Base
  before_action :create_cart

  private

    def create_cart
      if !session[:cart_id]
        cart = Cart.create
        session[:cart_id] = cart.id
      end
    end

    def set_cart
      @cart = Cart.find(session[:cart_id])
    end
end
