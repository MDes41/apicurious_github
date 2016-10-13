Rails.application.routes.draw do
  root "home#index"
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :repositories, only: [:index]
  get '/repositories/remote', to: 'repositories#remote'
  resources :dashboard, only: [:index]
end
