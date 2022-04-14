Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy] --use when need to expose certain actions, but not all of them.
  resources :articles
end
