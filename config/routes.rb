Rails.application.routes.draw do
  namespace :api do
    get 'pokemons/:id', to: 'pokemons#show'
  end
end
