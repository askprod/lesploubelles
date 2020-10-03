Rails.application.routes.draw do
  root to: "home#index"

  match "/search", to: "search#index", via: :get
  post '/search' => 'search#search'
  get '/search-streets/:city', to: 'search#search_streets'  

  match '/city/autocomplete', to: 'search#city_autocomplete', via: :get

  match "/calendar", to: "calendar#index", via: :get

  resources :cities, path: "villes", only: [:index, :show] do
      resources :streets, path: "", only: [:index, :show]
  end

end
