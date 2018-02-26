require_relative '../repository/sku_repository'
require_relative '../models/shopping_cart'

class ScanItem

  def initialize
    shopping_cart = ShoppingCart.new
    sku_repository = SkuRepository.new
    @checkout_service = CheckoutService.new(shopping_cart: shopping_cart, sku_repository: sku_repository)
  end

  def execute(sku_code:, quantity:)
    @checkout_service.scan(sku_code: sku_code, quantity: quantity)
  end

end