Rails.application.routes.draw do
  root 'home#index'
  get 'home/about'
  devise_for :users
  
end
