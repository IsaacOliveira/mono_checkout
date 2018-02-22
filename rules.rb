require_relative "sku_prices"

class Rules

  RULES = { "A" => SkuPrices.new({"1" => 50, "3" => 130}),
            "B" => SkuPrices.new({"1" => 30, "2" => 45}),
            "C" => SkuPrices.new({"1" => 20}),
            "D" => SkuPrices.new({"1" => 15}) }

  def sku_prices_by(sku)
    RULES[sku]
  end
end