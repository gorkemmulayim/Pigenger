Rails.application.routes.draw do
  get 'home/index'

  devise_for :users

  resources :chats, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end

  root 'home#index'
end
