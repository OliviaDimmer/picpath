Rails.application.routes.draw do
  get '/login', to: 'sessions#login', as: 'login'
  get '/logout', to: 'sessions#logout', as: 'logout'
  get '/auth/github', as: 'github_auth'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  resources :shoots
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'shoots#index'
end
