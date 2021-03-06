Rails.application.routes.draw do
  get 'group_chats/show'
  devise_for :fields, controllers: {
    sessions: 'fields/sessions',
    passwords: 'fields/passwords',
    registrations: 'fields/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  root to: 'homes#top'
  get 'homes/about'
  get 'homes/login'
  get 'homes/signup'
  get 'fields/ranking'
  get 'chat/:id' => 'chats#show', as: 'chat'
  get 'group_chats/:id' => 'group_chats#show', as: 'group_chats'
  post 'group_chats/:id' => 'group_chats#create', as: 'group_chat'
  resources :chats, only: [:create]

  resources :fields do
    resource :favorite, only: [:create, :destroy]
  end

  resources :infomations do
    resources :infomation_comments, only: [:create, :destroy]
  end

  resources :posts, only: [:new, :create, :show] do
    resources :pictures, only: [:show, :create, :show, :destroy] do
      resource :picture_hit, only: [:create, :destroy]
    end
  end

  resources :users do
    get :followings, on: :member
    get :followers, on: :member
    get 'rooms/index'
  end

  resources :relationships, only: [:create, :destroy]

  resources :chat_groups, only: [:index, :new, :create, :edit, :update, :destroy] do
    resource :join, only: [:create, :destroy]
  end
  post '/homes/guest_sign_in', to: 'homes#new_guest' # ゲストログイン
end
