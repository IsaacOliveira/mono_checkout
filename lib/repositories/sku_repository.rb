require_relative "../models/sku"

class SkuRepository

  def initialize
    @skus = [Sku.new(code: "A", price: 50),
             Sku.new(code: "B", price: 30),
             Sku.new(code: "C", price: 20),
             Sku.new(code: "D", price: 15)]
  end

  def get_sku_by(code:)
    @skus.detect{ |sku| sku.code == code }
  end
end