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
    resources :favorites, only: [:show, :create, :destroy]
  end

  resources :posts, only: [:new, :create, :show] do
    resources :pictures
  end
  
  resources :hits, only: [:index, :create, :destroy]
  resources :users, only: [:show, :edit, :update, :destroy]
end
