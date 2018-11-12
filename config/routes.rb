Rails.application.routes.draw do
  get "/heros", to: "heros#search", as: "heros_search"
  resources :battles
  resources :powers
  resources :heros
  resources :teams
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
