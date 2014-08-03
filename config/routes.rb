Rails.application.routes.draw do
  get '/' => 'application#index', as: 'root'
  get '/login' => 'sessions#new', as: 'login'
  resources :sessions, only: [:create, :destroy]

  resources :users, except: [:index] do
    get '/:id/feed' => 'users#index', as: 'user_feed'
  end

end
