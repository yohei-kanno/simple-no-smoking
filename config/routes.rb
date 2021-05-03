Rails.application.routes.draw do
  resources :users, only: %i[ new index create] do
    member do
      get :mode_select
    end
  end
end
