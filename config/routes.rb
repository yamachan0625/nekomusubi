Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  root 'tops#index'
  resources :users, only: [:edit, :update, :create, :new]
end
