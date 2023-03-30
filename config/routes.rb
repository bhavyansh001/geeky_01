Rails.application.routes.draw do
  get 'practice_area/index'
  root 'home#index'
  get 'home/about'
  devise_for :users
  
  resources :articles do
    resources :comments
  end

  get '/practice', to: 'practice_area#index'
  get '/bro_vs_pro', to: 'practice_area#bro_vs_pro'
  get '/bro_vs_bro', to: 'practice_area#bro_vs_bro'
  
  get '/level_up', to: 'level_up_session#level_up'

  post '/level_up', to: 'level_up_session#create'
  
  get '/question', to: 'level_up_session#question'

  get '/time_up', to: 'level_up_session#time_up'
end
