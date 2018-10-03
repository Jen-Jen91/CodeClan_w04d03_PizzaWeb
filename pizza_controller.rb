require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza_order' )
also_reload( './models/*' )

#index
get('/pizza-orders') do #use dashes for routes not underscores
  @pizzas = PizzaOrder.all() #make this an instance variable so that its available inthe views
  erb(:index)
end

#new routes - think about the order of operations (an open "ID" needs to be below a defined route)
get('/pizza-orders/new') do
  erb(:new)
end

#show route
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

#EDIT (like new)
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
