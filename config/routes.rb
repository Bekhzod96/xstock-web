Rails.application.routes.draw do
  
  resources :rooms, only: [:show, :index]
  resources :messages, only: [:create]
  resources :tweets, only: [:create, :update, :edit, :destroy] do 
    resources :likes, only: [:create, :destroy]
    resource :comments, only: [:show]
  end
  root 'home#index'
  get 'me', to: 'users#me'
  devise_for :users
  resources :users, only: [:show] do
    get 'followings', to: 'users#followings'
    get 'followers', to: 'users#followers'
    get 'photo', to: 'users#photo'
    get 'cover', to: 'users#cover'
  end
  resources :followings, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  get 'reset_unread', to: 'user_rooms#reset_unread'
  get 'search_stock', to: 'stocks#search'

  mount ActionCable.server, at: 'cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end