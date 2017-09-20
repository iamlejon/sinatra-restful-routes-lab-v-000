class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get 'recipes/:id' do
  @recipe = Recipe.find_by_id(params[:id])
  erb :show
  end

  post '/create' do #creates recipes
    recipe = Recipe.new(name: params[:recipe], ingredients: params[:ingredients],
    cook_time: params[:cool_time])
    recipe.save
  erb :index
end

post 'recipes/:id/edit'do
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.name = params[:name]
  @recipe.ingredients = [:ingredients]
  @recipe.cook_time = [:cook_time]
  @recipe.save
  redirect to "/recipes/#{@recipe.id}"
end

 post 'recipes/:id/delete' do
   @recipe = Recipe.find_by_id(params[:id])
   @recipe.delete
   redirect to '/recipes'
 end
end
