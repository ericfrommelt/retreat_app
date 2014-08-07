Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/login' => 'sessions#new', as: 'login'
  get '/logout' => 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:create, :destroy]

  resources :users, except: [:index] do
    get '/feed' => 'users#feed', as: 'feed'
    get '/friends' => 'users#friends', as: 'friends'
    get '/confirm_deletion' => 'users#confirm_deletion', as: 'confirm_deletion'
  end


  get '/search_friends' => 'users#search', as: 'search_friends'

  resources :friendships, only: [:create, :destroy]

  resources :friend_requests, only: [:index, :create, :destroy] do
    post 'accept', on: :member
    post 'reject', on: :member
  end

  resources :getaways
  resources :getaway_photos

  resources :getaways do
    get '/new_activity/:category' => 'activities#new', as: 'new_activity'
  end

  resources :activities, only: [:index, :create, :destroy]

end
