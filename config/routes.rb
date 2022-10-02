Rails.application.routes.draw do
  # get 'reservations/index'
  # get 'rooms/index'
  # get 'users/index'
  ##devise_for :admins
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "top#index"
  resources :reservations
  resources :rooms
  resources :users
    
  resources :rooms do
    resources :reservations
  end

end
