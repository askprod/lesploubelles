Rails.application.routes.draw do
  root to: "home#index"

  match "/search", to: "search#index", via: :get
  post '/search' => 'search#search'
  get '/search-streets/:city', to: 'search#search_streets'  

  match "/calendar", to: "calendar#index", via: :get

  resources :cities, path: "villes", only: [:show] do
      resources :streets, path: "", only: [:index, :show]
  end

end
