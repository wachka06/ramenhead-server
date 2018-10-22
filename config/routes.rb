Rails.application.routes.draw do
  resources :restaurants
  resources :favorites
  resources :reviews
  resources :users, only: [:show, :index]

  # get 'search/:action' => 'search#action'

  post '/ramenhead' => 'searches#businesses' #name of the routes is arbitrary!
  get '/ramenhead' => 'searches#businesses'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/add_favorite' => 'users#add_favorite_restaurant'

  get '/:id/get_favorites' => 'users#get_favorites'
end
