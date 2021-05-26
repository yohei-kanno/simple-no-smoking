Rails.application.routes.draw do
  
  resources :contacts
  namespace :admin do
    resources :users
  end
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  root to: "sessions#new"
  
  resources :password_resets, only: %i[ new create edit update ]
  
  resources :users, only: %i[ new create edit update destroy] do
    member do
      get :activate
    end
    resource :no_smoking_user_profile, only: %i[ new create show edit update destroy]
    
    resource :reduction_user_profile, only: %i[ new create show edit update destroy] do
      resources :stocks, only: %i[ index ]
    end
    
    resource :reset_start_date, only: %i[ update ]
    resource :modes, only: %i[ new create edit update ] do
      member do
        post :no_smoking
        post :reduction
      end
    end
    resource :smoke_counts, only: %i[ update ]
  end
      
  
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
