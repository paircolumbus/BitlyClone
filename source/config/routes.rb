Rails.application.routes.draw do

  root 'urls#new'

  resources :urls

end
