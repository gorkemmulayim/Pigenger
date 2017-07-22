Rails.application.routes.draw do
  get 'home/index'

  devise_for :users

  resources :chats, only: [:create]

  root 'home#index'
end
