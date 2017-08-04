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
    
  resources :users, only: [:new, :show, :index]
end
