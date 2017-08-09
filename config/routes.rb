Rails.application.routes.draw do
  devise_for :users
    
  devise_scope :user do
    authenticated do
      root 'users#new' 
    end
    unauthenticated do
      root 'devise/sessions#new'
    end
  end
    
  get '/settings', to: 'devise/registrations#update'
  get '/users',    to: 'users#index'
    
  resources :users, only: [:new, :show, :index]
  resources :posts, only: [:create, :destroy]
end
