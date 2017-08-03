Rails.application.routes.draw do
  devise_for :users
  root 'users#new'
    
  resources :users, only: [:new, :show, :index]
end
