Rails.application.routes.draw do
  get '/' => 'welcome#index', as: 'root'

  # get '/' => 'application#index', as: 'root'
  get '/login' => 'sessions#new', as: 'login'
  get '/logout' => 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:create, :destroy]

  resources :users, except: [:index] do
    get '/feed' => 'users#feed', as: 'feed'
    get '/search' => 'users#search', as: 'search'
  end

  resources :friendships
end
