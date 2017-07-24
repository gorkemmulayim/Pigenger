Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  resources :users, only: [:index, :show]

  resources :chats, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end
  resources :friendships

  root 'home#index'
end
