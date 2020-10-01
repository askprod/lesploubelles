Rails.application.routes.draw do
  root to: "home#index"

  match "/map", to: "map#index", via: :get
  match "/calendar", to: "calendar#index", via: :get

  get 'get_streets_by_city/:city_id', to: 'map#get_streets_by_city'  
  get '/map/search' => 'map#search'
end
