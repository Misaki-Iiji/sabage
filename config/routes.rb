Rails.application.routes.draw do
  devise_for :fields
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'

  get 'pictures/index'
  get 'pictures/edit'
  get 'pictures/update'
  get 'pictures/destroy'

  get 'fields/mypage'
  get 'fields/index'
  get 'fields/show'
  get 'fields/edit'
  get 'fields/update'

  get 'favos/show'
  get 'favos/create'
  get 'favos/destroy'

  get 'hits/show'
  get 'hits/create'
  get 'hits/destroy'

  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/exit'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
