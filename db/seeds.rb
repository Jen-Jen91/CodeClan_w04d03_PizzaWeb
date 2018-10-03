require_relative('../models/pizza_order')

PizzaOrder.delete_all()

pizza1 = PizzaOrder.new({
  "first_name" => "Walter",
  "last_name" => "White",
  "topping" => "Fish",
  "quantity" => 1
})

pizza2 = PizzaOrder.new({
  "first_name" => "Jesse",
  "last_name" => "Pinkman",
  "topping" => "Meat",
  "quantity" => 12
})

pizza1.save
pizza2.save
