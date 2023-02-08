Rails.application.routes.draw do

  root to: 'users#show'

  devise_for :users
  get '/' => "homes#top"
  
  resource :user, except: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
