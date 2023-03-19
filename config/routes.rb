Rails.application.routes.draw do

  get 'reviews/index'
  root to: 'users#show'

  devise_for :users
  get 'homes/top' => "homes#top"

  resource :user, except: [:new, :create, :destroy]
  resources :movies do
    resource :favorites, only: [:create, :destroy]
    resources :reviews, only: [:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
