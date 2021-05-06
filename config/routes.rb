Rails.application.routes.draw do
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  root to: "sessions#new"
  
  resources :users, only: %i[ new index create destroy] do
    resource :no_smoking_user_profile, only: %i[ new create show edit update]
  end
end
