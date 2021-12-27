Rails.application.routes.draw do
  root 'greetings#index'
  resources :users, only: %i[new create update]
  resources :urls, only: %i[input create]
  resource :session, only: %i[new create destroy]
  get '/update', to: 'users#edit'
  get '/users', to: 'users#new'
  post '/update', to: 'users#edit'
  get '/urls', to: 'urls#input'
  get '/sessions', to: 'sessions#new'
  get '/session', to: 'sessions#destroy'
end
