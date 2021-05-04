Rails.application.routes.draw do
  
  root to: 'users#new'
  
  resources :users, only: %i[ new index create] do
    member do
      get :mode_select
      post :create_mode_select
    end
    
    resource :no_smoking_user_profile, only: %i[ new create show edit update]
  end
end
