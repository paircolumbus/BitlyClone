Rails.application.routes.draw do
  resources :urls, only: [:index, :create]
  get '/:shortened_url', to: 'urls#redirect'
  root 'urls#index'
end
