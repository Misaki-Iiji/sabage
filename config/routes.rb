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

  resources :fields do
    member do
      get :mypage
    end
  end
  resources :pictures
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :favos, only: [:show, :create, :destroy]
    resources :hits, only: [:show, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
