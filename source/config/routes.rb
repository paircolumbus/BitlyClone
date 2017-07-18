Rails.application.routes.draw do
  resources :links

  get '/:new_url', to: 'links#show'

  root 'links#index'
end
