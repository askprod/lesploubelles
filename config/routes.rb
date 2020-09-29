Rails.application.routes.draw do
  root to: "home#index"

  match "/map", to: "map#index", via: :get
  match "/calendar", to: "calendar#index", via: :get
end
