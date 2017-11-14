Rails.application.routes.draw do

  get 'static_pages/friends'
    
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: "users/omniauth_callbacks" }

    
  devise_scope :user do
    authenticated do
      root 'posts#index' 
    end
    unauthenticated do
      root 'devise/sessions#new'
    end
  end
    
  get '/settings', to: 'devise/registrations#update'
  get '/users',    to: 'users#index'
  get '/pending',  to: 'static_pages#pending'
  #get '/about',    to: 'static_pages#about'
    
  resources :users, only: [:new, :show, :index, :edit, :update] do
      get '/about',    to: 'static_pages#about'
  end
    
  resources :posts, only: [:create, :destroy, :index] do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
  end
  resources :friendships, only: [:index, :show, :create, :update, :destroy]

end
