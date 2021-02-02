Rails.application.routes.draw do
  devise_for :fields, controllers: {
    sessions:      'fields/sessions',
    passwords:     'fields/passwords',
    registrations: 'fields/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root to: 'homes#top'
  get 'homes/about'
  get 'fields/ranking'
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:index, :create]

  resources :fields do
    resource :favorite, only: [:create, :destroy]
  end

  resources :posts, only: [:new, :create, :show] do
    resources :pictures, only: [:show, :create, :show] do
      resource :picture_hit, only: [:create, :destroy]
    end
  end
  
  resources :users
  resources :relationships, only: [:create, :destroy]
end
