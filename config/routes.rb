Rails.application.routes.draw do
  
  get 'modes/new'
  get 'modes/edit'
  get 'password_resets/new'
  get 'password_resets/edit'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  root to: "sessions#new"
  
  resources :password_resets, only: %i[ new create edit update ]
  
  resources :users, only: %i[ new create destroy] do
    resource :no_smoking_user_profile, only: %i[ new create show edit update]
    
    resource :reset_start_date,only: %i[ update ]
    resource :modes, only: %i[ new create edit update ] do
      member do
        post :no_smoking
      end
    end
  end
      
  
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
