class DiscountRule

  def initialize(skus:, quantity:, discounts:)
    @skus = skus
    @quantity = quantity
    @discounts = discounts
  end

  def matched_discounts(cart_items:)
    discounts = []

    discounts = @discounts if all_skus_match?(cart_items: cart_items)
    (discounts * number_of_times_matched(cart_items: cart_items)).flatten
  end

  private
  def all_skus_match?(cart_items:)
    skus = cart_items.map{ | cart_item | cart_item.sku }
    (@skus - skus).empty?
  end

  def number_of_times_matched(cart_items:)
    quantities = cart_items.map do | cart_item |
      if @skus.include?(cart_item.sku)
        cart_item.quantity / @quantity
      end
    end
    quantities.compact.min
  end

end
