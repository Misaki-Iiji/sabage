Rails.application.routes.draw do
  get 'posts/show'
  get 'posts/new'
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
  get 'fields/ranking' => 'fields#ranking'

  resources :fields do
    member do
      get :mypage
    end
    resource :field_favos, only: [:create, :destroy]
  end
  
  resources :posts, only: [:new, :create, :show] do
    resources :pictures
  end
  
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :hits, only: [:show, :create, :destroy]
  end
end
