Rails.application.routes.draw do
  root 'urls#home', only: [:index, :new, :create]
  get '/url/:short_url', to: 'urls#show', as: "short_url"

  resources :urls

end
