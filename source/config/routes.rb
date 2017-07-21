Rails.application.routes.draw do

  get '/links', to: 'links#index'

  post '/links', to: 'links#create'

  get '/:new_url', to: 'links#show', as: :link

  root 'links#index'
end
