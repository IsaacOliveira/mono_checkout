class Invoice

  attr_accessor :cart_items, :discounts

  def initialize(shopping_cart:, discounts:)
    @cart_items = shopping_cart.cart_items
    @discounts = discounts
  end

  def total_items_prices
    @cart_items.inject(0) { |sum, item| sum += item.total_price }
  end

  def total_discounts_value
    @discounts.inject(0) { |sum, discount| sum += discount.value }
  end

  def final_value
    total_items_prices - total_discounts_value
  end

  def ==(other)
    other.class == self.class && other.cart_items == self.cart_items && other.discounts == self.discounts
  end
end
