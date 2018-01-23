Rails.application.routes.draw do
  root "urls#index"

  resources :urls, only: [:index, :create, :show]

  get '/:id', to: 'urls#show', as: :shortened_url
end
