require 'models/sku'
require 'models/discount'
require 'models/shopping_cart'
require 'models/discount_rule'
require 'use_cases/generate_invoice'

RSpec.describe GenerateInvoice do
    let(:sku_a){ Sku.new(code: "A", price: 50) }
    let(:sku_b){ Sku.new(code: "B", price: 30) }
    let(:sku_c){ Sku.new(code: "C", price: 20) }
    let(:sku_d){ Sku.new(code: "D", price: 15) }

    let(:discount_a){ Discount.new(sku: sku_a, value: 20) }
    let(:discount_b){ Discount.new(sku: sku_b, value: 15) }
    let(:discount_c){ Discount.new(sku: sku_c, value: 10) }

    let(:discount_rule_a){ DiscountRule.new(skus: [sku_a], quantity: 3, discounts: [discount_a]) }
    let(:discount_rule_b){ DiscountRule.new(skus: [sku_b], quantity: 2, discounts: [discount_b]) }
    let(:discount_rule_c){ DiscountRule.new(skus: [sku_a, sku_b, sku_c], quantity: 1, discounts: [discount_c]) }

    let(:discount_rules){ [discount_rule_a, discount_rule_b, discount_rule_c] }

  context "with a shopping with four SKU A, five SKU B, three SKU D" do
    let(:shopping_cart){ ShoppingCart.new }
    let(:use_case){  GenerateInvoice.new(shopping_cart: shopping_cart, discount_rules: discount_rules ) }

    before do
      shopping_cart.add_item(sku: sku_a, quantity: 4)
      shopping_cart.add_item(sku: sku_b, quantity: 5)
      shopping_cart.add_item(sku: sku_d, quantity: 3)
    end

    it "the invoice as a final value price of 345" do
      invoice = use_case.execute
      expect(invoice.final_value).to be == 345
    end

    it "returns the invoice with one discount a and two discounts b" do
      invoice = use_case.execute
      expect(invoice).to be == Invoice.new(shopping_cart: shopping_cart, discounts: [discount_a, discount_b, discount_b])
    end

  end

  context "with a shopping cart with one SKU A, one SKU B, one SKU C" do
    let(:shopping_cart){ ShoppingCart.new }
    let(:use_case){ GenerateInvoice.new(shopping_cart: shopping_cart, discount_rules: discount_rules) }

    before do
      shopping_cart.add_item(sku: sku_a, quantity: 1)
      shopping_cart.add_item(sku: sku_b, quantity: 1)
      shopping_cart.add_item(sku: sku_c, quantity: 1)
    end

    it "the invoice as a final value price of 90" do
      invoice = use_case.execute
      expect(invoice.final_value).to be == 90
    end

    it "returns the invoice with the discount c" do
      invoice = use_case.execute
      expect(invoice).to be == Invoice.new(shopping_cart: shopping_cart, discounts: [discount_c])
    end
  end

end