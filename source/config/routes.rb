Rails.application.routes.draw do
  root to: "urls#index"

  resources :urls, only: [:index, :create, :show], path: '/'
end
