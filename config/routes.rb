Rails.application.routes.draw do
  root 'static_pages#home'

  # static pages
  get '/about',   to: 'static_pages#about'
  get '/help',    to: 'static_pages#help'

  # CRUD routes (RESTful)
  resources :users
end
