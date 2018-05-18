Rails.application.routes.draw do
  root 'urls#home'
  resources :urls

  #get '/url/:short_url', to: 'urls#show', as: "short_url"
  get '/url/:short_url', to: 'urls#short_url', as: "short_url"

end
