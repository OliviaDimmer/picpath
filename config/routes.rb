Rails.application.routes.draw do
  # get '/login', to: 'sessions#login', as: 'login'
  get '/login', to: redirect('/auth/google_oauth2')
  get '/logout', to: 'sessions#logout', as: 'logout'
  get '/auth/google_oauth2', as: 'google_auth'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get '/shoots/ics_export/:id', to: 'shoots#ics_export', as: 'ics_export'
  resources :shoots, :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'shoots#index'
end
