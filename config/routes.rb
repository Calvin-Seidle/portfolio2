Rails.application.routes.draw do
  resources :contacts
  resources :posts
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'visitors#index'
  
  devise_for :users
  resources :users do 
  	member do
  		get :following, :followers
  	end
  end

  resources :relationships, only: [:create, :destroy]
end
