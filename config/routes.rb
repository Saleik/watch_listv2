Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :lists, only: [:index, :new, :create, :show, :edit] do
    resources :bookmarks, only: [:new, :create]
  end

  resources :lists, only: :destroy
  resources :bookmarks, only: :destroy
end
