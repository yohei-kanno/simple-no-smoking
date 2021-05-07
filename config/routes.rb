Rails.application.routes.draw do
  
  get 'password_resets/new'
  get 'password_resets/edit'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  root to: "sessions#new"
  
  resources :password_resets
  
  resources :users, only: %i[ new create destroy] do
    resource :no_smoking_user_profile, only: %i[ new create show edit update]
    
    resource :reset_start_date,only: %i[ update ]
  end
  
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
