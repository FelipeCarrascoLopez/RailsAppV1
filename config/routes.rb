Rails.application.routes.draw do
  resources :comments, only: %i[create destroy]
  resources :categories
  resources :profiles

  get '/confirm_email/:token', to: 'users#confirm_email'
  delete '/logout', to: "sessions#destroy", as: 'logout'

  post '/login', to: "sessions#create", as: 'new_user_session'
  get '/login', to: "sessions#login", as: 'login'

  delete "/user/:id", to: "users#destroy", as: "user_destroy"
  patch "/user/:id", to: "users#update"
  get "/user/:id/edit", to: "users#edit", as: "user_edit"
  get "/user/:id", to: "users#show", as: "user"
  post '/users', to: "users#create"
  get '/signup', to: "users#new", as: "signup"
  get '/users', to: 'users#index'

  delete "/article/:id", to: "articles#destroy", as: "article_destroy"
  patch "/article/:id", to: "articles#update"
  get "/article/:id/edit", to: "articles#edit", as: "article_edit"
  get "/article/:id", to: "articles#show", as: "article"
  get "/articles/new", to: "articles#new"
  post "/articles", to: "articles#create"
  get "/articles", to: "articles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
