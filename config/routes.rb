Rails.application.routes.draw do
  get "/heros/search", to: "heros#search", as: "heros_search"
  get "heros/search_results", to: "heros#search_results", as: "hero_search_results"

  get "/heros/create_from_api", to: "heros#add_hero_from_cv", as: "heros_search_create"

  # Path for finding hero from team page
  get "user/:user_id/teams/:id/add_hero", to: "heros#add_to_team", as: "add_hero"

  #Path for actually adding hero to team
  post "user/:user_id/teams/:id/add_hero/:hero_id", to: "teams#add_to_team", as: "add_hero_to_team"

  patch "user/:user_id/teams/:id/add-hero", to: "teams#add_hero", as: "add_heros_team"

  get 'sessions/login', to: 'sessions#new', as: 'login'

  post 'sessions/login', to: 'sessions#create', as: 'sessions'
  get '/battles/:id/fight', to: 'battles#team_fight', as: 'battle_fight'

  delete "sessions/login", to: "sessions#destroy"

  # Remove hero from team path
  delete "users/:user_id/teams/:team_id/hero/:hero_id", to: 'teams#remove_from_team', as: 'remove_from_team'

  resources :battles
  resources :powers
  resources :heros
  # Teams has been nested in users
  resources :users do
    resources :teams
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
