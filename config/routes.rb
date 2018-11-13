Rails.application.routes.draw do
  get "/heros/search", to: "heros#search", as: "heros_search"
  get "/heros/create_from_api", to: "heros#add_hero_from_cv", as: "heros_search_create"
  resources :battles
  resources :powers
  resources :heros
  resources :teams
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
