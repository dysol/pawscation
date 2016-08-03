Rails.application.routes.draw do
  root 'static_pages#home'

  # static pages
  get '/about',   to: 'static_pages#about'
  get '/help',    to: 'static_pages#help'

  # Dynamic routes (users)
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  # CRUD routes (RESTful)
  resources :users,   except: [ :new ]
end
