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

  get 'posts/show'
  get 'posts/new'
  root to: 'homes#top'
  get 'homes/about'
  get 'users' => 'users#dummy'

  resources :fields do
    member do
      get :mypage
    end
    resources :favorites, only: [:index, :create, :destroy]
  end

  resources :posts, only: [:new, :create, :show] do
    resources :pictures, only: [:show, :create, :show]
  end

  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :hits, only: [:show, :create, :destroy]
  end
end
