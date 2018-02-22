class SkuPricingRules

  def initialize(sku_prices, quantity)
    @sku_prices = sku_prices
    @quantity = quantity
  end

  def total_price
    number_of_special_prices, number_of_individuals = number_of_special_prices_and_individuals
    total_sum(number_of_special_prices, number_of_individuals)
  end

  private
  def number_of_special_prices_and_individuals
    @quantity.divmod(@sku_prices.special_quantity)
  end

  def total_sum(number_of_special_prices, number_of_individuals)
    @sku_prices.sum_of_special_prices(number_of_special_prices) + @sku_prices.sum_of_individuals(number_of_individuals)
  end

end