Rails.application.routes.draw do
  get 'ratings/create'
  get 'dashboards/index'
  get 'reservation/new'
  get 'reservation/create'
  get 'reservation/edit'
  get 'reservation/update'
  devise_for :users
  root to: "items#index"
  #root to: "items#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  #Defines the root path route ("/")
  root "items#index"


  resources :users do
    get "/profile", to: "pages#profile", as: :profile
    post "/profile", to: "comments#create", as: :comments
  end
  
  resources :dashboards, only: [:index]
  
  resources :items do
    resources :reservations, only: [:new, :create]
    resources :reviews, only: [:new, :create]
    resources :ratings, only: [:create]
  end
  resources :reservations, only: [:create, :edit, :update]

  resources :reviews, only: [:destroy]

  resources :comments, only: [:create, :destroy]

end
