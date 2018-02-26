require_relative "cart_item"

class ShoppingCart

  attr_accessor :cart_items

  def initialize
    @cart_items = []
  end

  def add_item(sku:, quantity:)
    item = get_item_by(sku: sku)
    if item.nil?
      item = CartItem.new(sku: sku, quantity: quantity)
      @cart_items << item
    else
      item.add(quantity: quantity)
    end
  end

  private
  def get_item_by(sku:)
    @cart_items.detect{ |item| item.sku == sku }
  end
end