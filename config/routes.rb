Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  resources :users do
    get :search, on: :collection
  end
  resources :categories
  resources :stadiums
  resources :areas
  resources :games do
    get :search, on: :collection
  end
  resources :comments
  resources :recruitments

 
  

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resource :account,only:[:show,:edit,:update]
end
