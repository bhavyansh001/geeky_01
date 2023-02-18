Rails.application.routes.draw do

  root 'home#index'
  get 'home/about'
  devise_for :users
  
  resources :articles do
    resources :comments
  end
end
