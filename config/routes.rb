Rails.application.routes.draw do
  root  'users#index'
  get 'accounts/show'
  get 'accounts/edit'
  get 'sessions/new'
  get 'users/new'
  get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  resources :users
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resource :account,only:[:show,:edit,:update]
end
