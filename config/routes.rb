Rails.application.routes.draw do
  devise_for :users

  root to: 'lists#index'

  resources :lists, only: [:new, :create, :show, :edit] do
    resources :bookmarks, only: [:new, :create]
  end

  resources :lists, only: :destroy
  resources :bookmarks, only: :destroy
end
