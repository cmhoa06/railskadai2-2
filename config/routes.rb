Rails.application.routes.draw do
 
  get 'reservations/index'
  get 'rooms/index'
  get 'users/show'
  devise_for :users
  root 'pages#index'
  get 'pages/show'
  resources :rooms do
    collection do
      get 'search'
    end
  end
  resources :reservations do
    collection do
      post 'confirm'
    end
  end
  resources :users, only: [:show, :edit, :update]
  resources :rooms
  resources :reservations
  get '/mypage' => 'users#mypage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'users/:id/edit' => 'users#show'
  post 'reservations/:id' => 'reservations#index'
end

