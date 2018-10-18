Rails.application.routes.draw do
  resources :restaurants
  resources :favorites
  resources :reviews
  resources :users, only: [:show]

  # get 'search/:action' => 'search#action'

  post '/ramenhead' => 'searches#businesses' #name of the routes is arbitrary!
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
