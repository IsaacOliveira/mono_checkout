require_relative '../services/discount_rules_matcher'
require_relative '../models/invoice'

class GenerateInvoice

  def initialize(shopping_cart:, discount_rules:)
    @shopping_cart = shopping_cart
    @discount_rules = DiscountRulesMatcher.new(discount_rules: discount_rules)
  end

  def execute
    cart_items = @shopping_cart.cart_items
    discounts = @discount_rules.get_applicable_discounts(cart_items: cart_items)
    Invoice.new(shopping_cart: @shopping_cart, discounts: discounts)
  end

end