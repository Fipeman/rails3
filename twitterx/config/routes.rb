Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :retweets, only: [:create, :destroy]
    end
    root to: "tweets#index"
  end    
  
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

