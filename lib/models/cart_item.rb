class CartItem

  attr_accessor :sku, :quantity

  def initialize(sku:, quantity: 0)
    @sku = sku
    @quantity = quantity
  end

  def add(quantity: 1)
    @quantity += quantity
  end

  def total_price
    @sku.price * quantity
  end
end