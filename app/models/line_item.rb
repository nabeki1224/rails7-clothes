class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def amount
    self.quantity * self.product.price
  end
end