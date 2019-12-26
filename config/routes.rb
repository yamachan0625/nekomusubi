Rails.application.routes.draw do
  devise_for :users,controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end

  resources :users, only: [:index, :edit, :update, :create, :new, :show, ] 
    
  resources :posts do
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:create,:show] do
    collection do
      get 'new_message', defaults: { format: 'json' }
    end
  end
  resources :messages, only: [:create]
    
  root 'tops#index'
end
