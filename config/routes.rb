Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/login' => 'sessions#new', as: 'login'
  get '/logout' => 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:create, :destroy]

  resources :users, except: [:index] do
    get '/feed' => 'users#feed', as: 'feed'
  end


  get '/search_friends' => 'users#search', as: 'search_friends'

  resources :friendships, only: [:create, :destroy]

  resources :friend_requests, only: [:create, :destroy] do
    post 'accept', on: :member
    post 'reject', on: :member
  end

  resources :getaways

end
