Rails.application.routes.draw do
  get "/heros/search", to: "heros#search", as: "heros_search"

  get "/heros/create_from_api", to: "heros#add_hero_from_cv", as: "heros_search_create"

  patch "user/:user_id/teams/:id/add-hero", to: "teams#add_hero", as: "add_heros_team"

  get 'sessions/login', to: 'sessions#new', as: 'login'

  post 'sessions/login', to: 'sessions#create', as: 'sessions'
  get '/battles/:id/fight', to: 'battles#team_fight', as: 'battle_fight'

  delete "sessions/login", to: "sessions#destroy"

  resources :battles
  resources :powers
  resources :heros
  # Teams has been nested in users
  resources :users do
    resources :teams
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
