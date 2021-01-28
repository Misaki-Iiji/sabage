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
  get 'users' => 'users#dummy'
  get 'fields/ranking'

  resources :fields do
    member do
      get :mypage
    end
    resource :favorite, only: [:create, :destroy]
  end

  resources :posts, only: [:new, :create, :show] do
    resources :pictures, only: [:show, :create, :show] do
      resource :hit, only: [:create, :destroy]
    end
  end

  resources :users, only: [:show, :edit, :update, :destroy]
end
