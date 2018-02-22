class SkuPrices

  attr_accessor :unitary_price, :special_price, :special_quantity

  def initialize(rule)
    @unitary_price = rule.values.first
    @special_price = rule.values.last
    @special_quantity = rule.keys.last.to_i
  end

  def sum_of_special_prices(quantity)
    quantity * @special_price
  end

  def sum_of_individuals(quantity)
    quantity * @unitary_price
  end



end