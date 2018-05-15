Rails.application.routes.draw do
  resources :urls, only: [:index, :new, :create]

  get "/:short_url", to: "urls#show", as: "short_url"

  resources :users, only: [:new, :create, :show]
end
