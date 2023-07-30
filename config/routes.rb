
require 'sidekiq/web'
Rails.application.routes.draw do


  mount Sidekiq::Web => '/sidekiq'
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :restaurants do
    resources :dishes, only: [:index, :new, :create]  # Nested resources for dishes under restaurants
    resources :reviews, only: [:create]
  end

  resources :dishes, only: [:show, :edit, :update, :destroy] do
    resources :reviews, only: [:create]
  end

  patch 'restaurants/:id/update_status', to: 'restaurants#update_status', as: :update_status_restaurant

  root 'restaurants#index'
end
