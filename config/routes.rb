Rails.application.routes.draw do
  get '/metrics', to: 'metrics#index'
  root 'home#index'
  get 'home/about'
  devise_for :users, controllers: { sessions: 'users/sessions'}
  resources :articles do
    resources :comments
  end
  get '/practice', to: 'practice_area#index'
  get '/bro_vs_pro', to: 'practice_area#bro_vs_pro'
  get '/bro_vs_bro', to: 'practice_area#bro_vs_bro'
  get '/level_up', to: 'practice_area#level_up'
  post '/level_up', to: 'level_up_session#create'
  get '/question', to: 'level_up_session#question'
  get '/time_up', to: 'level_up_session#time_up'
  resources :rooms, only: [:create, :show] do
    resources :bro_session, only: [:index]
  end
  post '/rooms/:room_id/bro_session', to: "bro_session#create"
  get 'rooms/:room_id/dashboard', to: "bro_session#dashboard",
   as: "room_dashboard"
  get '/profile', to: 'stats#stats'
end
