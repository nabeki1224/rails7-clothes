class StripeCheckout
  class << self
    include Rails.application.routes.url_helpers

    def make_stripe_checkout_params(cart:)
      {
        payment_method_types: ['card'],
        line_items: make_line_items_params(cart: cart),
        mode: 'payment',
        success_url: payments_success_url,
        cancel_url: carts_url,
      }
    end

    private
  
    def make_line_items_params(cart:)
      line_items = []

      cart.line_items.each do |line_item|
        line_items << {
          price_data: {
            unit_amount: line_item.product.price,
            currency: 'jpy',
            product_data: {
              name: line_item.product.name,
              description: line_item.product.description,
            }
          },
          quantity: line_item.quantity,
        }
      end

      line_items
    end
  end
end