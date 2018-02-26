class CheckoutService

  def initialize(shopping_cart:, sku_repository:)
    @shopping_cart = shopping_cart
    @sku_repository = sku_repository
  end

  def scan(sku_code:, quantity: 1)
    sku = @sku_repository.get_sku_by(code: sku_code)
    @shopping_cart.add_item(sku: sku, quantity: quantity)
    @shopping_cart
  end

end