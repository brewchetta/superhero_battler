Rails.application.routes.draw do
  get "/heros", to: "heros#search", as: "heros_search"
  resources :battles
  resources :powers
  resources :heros
  resources :teams
  resources :users

  # Had to build a new route for this, for some reason the resources didn't include it?
  post '/users/new', to: 'users#create', as: 'new_user_path'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
