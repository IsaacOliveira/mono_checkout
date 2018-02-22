require_relative "sku_pricing_rules"

class GetTotalSkuPriceByQuantity

  def initialize(rules, sku, quantity)
    sku_prices = rules.sku_prices_by(sku)
    @pricing_rules = SkuPricingRules.new(sku_prices, quantity)
  end

  def execute
    @pricing_rules.total_price
  end

end
