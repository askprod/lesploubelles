Rails.application.routes.draw do
  root to: "home#index"

  match "/search", to: "search#index", via: :get
  post '/search' => 'search#search'

  match "/calendar", to: "calendar#index", via: :get

  resources :cities, path: "villes" do
      resources :streets, path: "", only: [:index, :show]
  end

  get '/search-streets/:city', to: 'search#search_streets'  
end
