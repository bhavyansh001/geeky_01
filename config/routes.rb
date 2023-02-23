Rails.application.routes.draw do
  get 'practice_area/index'
  root 'home#index'
  get 'home/about'
  devise_for :users
  
  resources :articles do
    resources :comments
  end

  get '/practice', to: 'practice_area#index'
  resources :questions, only: [:create]
end
