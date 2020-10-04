Rails.application.routes.draw do
  root to: "search#index"
  match '/', to: "search#index", as: "search", via: :get
  post '/', to: 'search#search'

  get '/search-streets/:city', to: 'search#search_streets'  
  match '/city/autocomplete', to: 'search#city_autocomplete', via: :get
  match "/calendar", to: "calendar#index", via: :get

  resources :cities, path: "villes", only: [:index, :show] do
      resources :bin_greens, path: "poubelles-dechets-verts", only: [:index]
      resources :bin_recycles, path: "poubelles-recyclage", only: [:index]
      resources :bin_wastes, path: "poubelles-ordures", only: [:index]
      resources :streets, path: "", only: [:index, :show] do
          resources :bin_greens, path: "poubelles-dechets-verts", only: [:index]
          resources :bin_recycles, path: "poubelles-recyclage", only: [:index]
          resources :bin_wastes, path: "poubelles-ordures", only: [:index]
      end
  end

end
