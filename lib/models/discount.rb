class Discount

  attr_accessor :sku, :value

  def initialize(sku:, value:)
    @sku = sku
    @value = value
  end

end