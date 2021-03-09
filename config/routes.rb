Rails.application.routes.draw do
  get 'hangouts/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'hangouts#index'
  resources :posts 
  resources :users 
  
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]


  resources :friend_requests, only: [:create, :destroy]


end
