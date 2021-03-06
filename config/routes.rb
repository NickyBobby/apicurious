Rails.application.routes.draw do
  root 'users#new'
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  get '/:username', to: 'users#show', as: "user"
  delete '/logout', to: 'sessions#destroy', as: :logout
end
