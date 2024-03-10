Rails.application.routes.draw do
  resources :pesanans
  resources :wisata
  resources :rekenings
  resources :admins
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  get "sign_in_admin", to: "admins#sign_in_admin"
  get "sign_in_user", to: "users#sign_in_user"

  # Defines the root path route ("/")
  # root "posts#index"
end
