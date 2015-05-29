Rails.application.routes.draw do
  resources :urls, only: [:index, :new, :create, :show], path: '/'
end
