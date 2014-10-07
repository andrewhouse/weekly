Rails.application.routes.draw do
  get '/profile/:id' => "users#profile", as: 'profile'
  post '/ban' => 'users#ban', as: 'ban'
  devise_for :users
  root 'static_pages#home'
  resources :items do
    resources :images
  end
  resources :projections, only: :create
end
