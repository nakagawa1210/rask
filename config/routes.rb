Rails.application.routes.draw do

  resources :projects
  resources :tasks
  resources :users

  get '/', to: redirect('/projects')

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
