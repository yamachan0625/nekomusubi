Rails.application.routes.draw do
  devise_for :users,controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  resources :users, only: [:index, :edit, :update, :create, :new, :show]
  resources :posts, only: [:index, :show, :create, :show]
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  root 'tops#index'
end
