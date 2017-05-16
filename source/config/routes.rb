Rails.application.routes.draw do

  root 'urls#new'

  resources :urls

  get '/:short_extension', to: 'urls#redirect_short'
end
