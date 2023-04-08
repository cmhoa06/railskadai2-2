Rails.application.routes.draw do
  devise_for :users
  get 'rooms/index'
  get 'users/profile/edit/', to: 'users/profiles#edit'
  get 'users/profile/show/', to: 'users/profiles#show'
  get '/users/:id', to: 'users/accounts#show'
  patch 'users/:id', to: 'users/profiles#update'
  root to: "pages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :rooms
  resources :pages
  resources :reservations
  get 'search' => 'rooms#search'
  post 'users/:id/edit' => 'users#show'
end
