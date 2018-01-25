Rails.application.routes.draw do
  root "urls#index"

  resources :urls, only: [:index, :create]

  get '/:slug', to: 'urls#show'
end
