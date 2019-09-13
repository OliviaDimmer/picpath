Rails.application.routes.draw do
  get 'sessions/create'
  resources :shoots
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'shoots#index'
end
