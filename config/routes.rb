Rails.application.routes.draw do
  get '/profile/:id' => "users#profile"
  devise_for :users
  root 'static_pages#home'
  resources :items
  resources :projections, only: :create
end
