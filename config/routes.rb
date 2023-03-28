Rails.application.routes.draw do
  get 'practice_area/index'
  root 'home#index'
  get 'home/about'
  devise_for :users
  
  resources :articles do
    resources :comments
  end

  get '/practice', to: 'practice_area#index'
  
  get '/level_up', to: 'practice_area#level_up'
  get '/bro_vs_pro', to: 'practice_area#bro_vs_pro'
  get '/bro_vs_bro', to: 'practice_area#bro_vs_bro'

  post '/level_up', to: 'practice_area#create'
  
  get '/question', to: 'practice_area#question'

  get '/time_up', to: 'practice_area#time_up'
end
