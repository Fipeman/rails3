Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get '/user/profile', to: 'user#profile'
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :retweets, only: [:create, :destroy]
    resources :follows, only: [:create, :destroy]
    end
    root to: "tweets#index"
    get '/api/:news', to: 'api#news'
    post '/api/:tweet', to: 'api#tweet'
    get '/api/:start_date/:end_date', to: 'api#date'
  end    
  
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

