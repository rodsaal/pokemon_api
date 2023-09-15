Rails.application.routes.draw do
  namespace :api do
    resources :pokemons, only: [:show]
  end

end
