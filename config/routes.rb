Rails.application.routes.draw do
  #get 'hangouts/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts 
  resources :users 
  
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]


  resources :friend_requests, only: [:create, :destroy, :accept]
  put 'friend_requests/accept'
  post 'friend_requests/accept'
  #delete 'friend_requests'
  put 'friend_requests/decline'
  post 'friend_requests/decline'



end
