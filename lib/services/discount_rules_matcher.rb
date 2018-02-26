class DiscountRulesMatcher

  def initialize(discount_rules:)
    @discount_rules = discount_rules
  end

  def get_applicable_discounts(cart_items:)
    discounts = []
    @discount_rules.each do | discount_rule |
      discounts << discount_rule.matched_discounts(cart_items: cart_items)
    end

    discounts.flatten
  end

end

