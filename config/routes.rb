Rails.application.routes.draw do
  devise_for :users

  root to: "boards#index"

  resources :boards do
    resources :tasks, only: [:new, :create, :edit, :update, :destroy]
  
  end

  resource :profile, only: [:show, :edit, :update]
end
