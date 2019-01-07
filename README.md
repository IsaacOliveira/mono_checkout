Models

  Sku: it’s self explanatory, it has a code and a value.
  CartItem: I think of that as each line from a shopping cart, it contains the SKU with the quantity that the client wanted. I think it’s a real concept, but I am not sure about the name, maybe need to talk with product people to figure out a better name.
  ShoppingCart: For me is just a set of CartItems, is the responsible to add and retrieve items
  Discount: Its specified by a Sku and a value, I am using a fixed value, but if i need to do a percent value i could implement one that calculate from the Sku value.
  DiscountRule: A rule is defined by a list of skus and a quantity, so if all sku on the rule are in the shopping cart, and with the specified quantities, the discount rule returns the discounts, the number of times that are matched. 
  DiscountRule examples: if a made a rule with SKU A, quantity 2, Discount A, and my shopping cart has 5 SKU A, the discount rule will return 2 Discount A.  a Rule With SKU A, SKU B, SKU C, quantity 1, Discount C, and my shopping cart has 2 SKU, 1 SKU B, 3 SKU C, the discount rule will return 1 Discount C.
  Invoice: It’s a model that has the final information about the shopping, with all the items, the discounts, and values
  Services

Checkout service: i considered the checkout more a service than a model, it’s only responsible to scan the items and put in the shopping cart
Discount rules matcher: i needed a service to loop through all the discount rules and return all the matched discounts of a shopping cart.


Use cases

Scan item: the use case to scan the items 
Generate Invoice: to generate the invoice i need the shopping cart and all the discount rules, so call the discounts rules matcher to get the applicable discounts for that shopping cart, and after that initialize the Invoice with the shopping cart and the discounts.


Tests

I used Rspec to made the tests so you need to have the rspec gem installed to run, 

I am more confortable using Rspec and I think that express better the specs. 

I focused only on testing the Generate Invoice use case, so the test acts as an integration test, i did all the setup of the rules and shopping cart, one improviment would be to use factories to build the objects as it gets complex.
