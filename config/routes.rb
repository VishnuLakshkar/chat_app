Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
  resources :users do
    member do
      get :block_list
    end
  end

  resources :relationships, only: [:create, :destroy]
  resources :conversations, only: [:create, :index] do
    resources :messages, only: [:create, :index]
  end
end