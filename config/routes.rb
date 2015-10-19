Rails.application.routes.draw do

  root 'static_pages#home'
  get 'static_pages/home' => 'static_pages#home'

  resources :users
  get 'signup' => 'users#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end
