# require 'models/sku'
# require 'models/shopping_cart'
# require 'models/cart_item'

# RSpec.describe GenerateInvoice do
#     let(:sku_a){ Sku.new(code: "A", price: 50) }
#     let(:sku_b){ Sku.new(code: "B", price: 30) }
#     let(:sku_c){ Sku.new(code: "C", price: 20) }
#     let(:sku_d){ Sku.new(code: "D", price: 15) }

#     let(:use_case){ ScanItem.new }
#     context "scanning the " do

#       it "returns an shopping cart with the items " do
#         use_case.execute(code: "A", quantity: )
#       end
#     end
# end