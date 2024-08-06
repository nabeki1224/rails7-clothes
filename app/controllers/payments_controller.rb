class PaymentsController < ApplicationController
  before_action :set_cart, only: %i[checkout success]

  def checkout
    redirect_to carts_path and return if @cart.line_items.empty?

    @session = Stripe::Checkout::Session.create(StripeCheckout.make_stripe_checkout_params(cart: @cart))
  end

  def success
    @cart.line_items.delete_all
    redirect_to root_path
  end
end
