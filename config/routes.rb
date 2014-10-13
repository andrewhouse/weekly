Rails.application.routes.draw do
  get 'templates/serve'

  get '/home' => 'static_pages#home'
  get '/templates/:name' => "templates#serve", as: 'template'
  get '/profile/:id' => "users#profile", as: 'profile'
  post '/ban' => 'users#ban', as: 'ban'
  devise_for :users
  root 'static_pages#data'
  resources :items do
    resources :images
  end
  resources :projections, only: :create
end
