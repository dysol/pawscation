Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'

  # static pages
  get '/about',   to: 'static_pages#about'
  get '/help',    to: 'static_pages#help'

  # Dynamic routes (users)
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  # Login routes (session)
  get     '/login',     to: 'sessions#new'
  # get     '/account',   to: 'sessions#edit'
  post    '/login',     to: 'sessions#create'
  # patch   '/account',   to: 'sessions#update'
  delete  '/logout',    to: 'sessions#destroy'

  # CRUD routes (RESTful)
  resources :users,   except: [ :new ]
end
