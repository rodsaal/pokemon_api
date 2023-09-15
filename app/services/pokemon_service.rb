# frozen_string_literal: true

class PokemonService
  require 'rest-client'

  def self.get_info(name)
    url = "https://pokeapi.co/api/v2/pokemon/#{name}/"

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
end