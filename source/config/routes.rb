Rails.application.routes.draw do
  resources :urls
  root 'urls#index'
  get ':unique_key' => 'urls#show'
  get 'urls/show_key/:unique_key' => 'urls#show_key'
end
