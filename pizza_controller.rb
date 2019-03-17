require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( './models/pizza_order' )
also_reload( './models/*' )

#INDEX
get('/pizza-orders') do
  @pizzas = PizzaOrder.all()
  erb(:index)
end

#NEW
get('/pizza-orders/new') do
  erb(:new)
end

#SHOW
get('/pizza-orders/:id') do
  id = params[:id].to_i()
  @pizza = PizzaOrder.find(id)
  erb(:show)
end

#CREATE
post('/pizza-orders') do
  @pizza = PizzaOrder.new(params)
  @pizza.save()
  erb(:create)
end

#UPDATE
post('/pizza-orders/:id') do
  @pizza = PizzaOrder.new(params)
  @pizza.update()
  erb(:update)
end

#EDIT
get('/pizza-orders/:id/edit') do
  id = params[:id].to_i()
  @pizza = PizzaOrder.find(id)
    erb(:edit)
end

#DELETE
post('/pizza-orders/:id/delete') do
  @pizza = PizzaOrder.new(params)
  @pizza.delete()
  erb(:delete)
end
