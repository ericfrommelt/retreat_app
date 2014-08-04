Rails.application.routes.draw do
  get '/' => 'application#index', as: 'root'
  get '/login' => 'sessions#new', as: 'login'
  resources :sessions, only: [:create, :destroy]

  resources :users, except: [:index] do
    get '/feed' => 'users#feed', as: 'feed'
  end

  get '/search_locales' => 'places#seach', as: 'search_places'
end
