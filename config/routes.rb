Rails.application.routes.draw do
  get 'sessions/create'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  resources :shoots
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'shoots#index'
end
