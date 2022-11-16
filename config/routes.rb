Rails.application.routes.draw do
  devise_for :users

  root to: 'lists#index'

  resources :lists, only: [:new, :create, :show, :edit, :destroy]
  resources :bookmarks, only: [:create, :destroy]
end
