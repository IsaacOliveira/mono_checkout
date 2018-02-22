require_relative 'get_total_sku_price_by_quantity'

class CheckOut

  def initialize(rules)
    @items = {}
    @rules = rules
  end

  def scan(sku)
    @items[sku] ||= 0
    @items[sku] += 1
  end

  def total
    total = 0
    @items.each do | sku, quantity |
      total += GetTotalSkuPriceByQuantity.new(@rules, sku, quantity).execute
    end
    total
  end
end

