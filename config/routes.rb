Rails.application.routes.draw do
  
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/login" => "sessions#destory"
  
  root to: "sessions#new"
  
  resources :users, only: %i[ new index create] do
    member do
      get :mode_select
      post :create_mode_select
    end
    
    resource :no_smoking_user_profile, only: %i[ new create show edit update]
  end
end
