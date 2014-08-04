Rails.application.routes.draw do
  get '/' => 'application#index', as: 'root'
  get '/login' => 'sessions#new', as: 'login'
  resources :sessions, only: [:create, :destroy]

  resources :users do
    get '/feed' => 'users#index', as: 'feed'
  end

  resources :friendships
end
