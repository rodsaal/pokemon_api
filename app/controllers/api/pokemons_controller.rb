class Api::PokemonsController < ApplicationController
  require 'rest-client'

  def get_pokemon_info(pokemon_name)
    url = "https://pokeapi.co/api/v2/pokemon/#{pokemon_name}/"

    begin
      response = RestClient.get(url)

      if response.code == 200
        pokemon_data = JSON.parse(response.body)
        return {
          name: pokemon_data['name'],
          abilities: pokemon_data['abilities'].map { |ability| ability['ability']['name'] }.sort
        }
      end
    rescue RestClient::ExceptionWithResponse => e
      return { error: "Pokemon não encontrado" }
    end
  end

  def show
    pokemon_info = get_pokemon_info(params[:id])
    if pokemon_info
      render json: pokemon_info
    else
      render json: { error: "Pokemon not found" }, status: :not_found
    end
  end
end
