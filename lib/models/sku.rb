class Sku

  attr_accessor :code, :price

  def initialize(code:, price:)
    @code = code
    @price = price
  end

  def ==(other)
    other.class == self.class && other.code == self.code
  end
end