Rails.application.routes.draw do

  get 'static_pages/home' => 'static_pages#home'
  root 'static_pages#home'

  resources :users
  get 'signup' => 'users#new'

end
