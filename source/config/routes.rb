Rails.application.routes.draw do
  resources :urls, only: [:index, :new, :create]
  resources :users, only: [:create, :show]

  get "/login", to: "sessions#new", as: "log_in"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "log_out"
  get "/signup", to: "users#new", as: "sign_up"

  get "/:short_url", to: "urls#show", as: "short_url"
end
