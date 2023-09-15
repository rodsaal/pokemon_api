require 'rails_helper'

RSpec.describe Api::PokemonsController, type: :controller do
  describe 'GET #show' do
    it 'returns a JSON response with the Pokemon info' do
      pokemon_info = { 'name' => 'Pikachu', 'type' => 'Electric' } # Changed keys to strings
      allow(PokemonService).to receive(:get_info).and_return(pokemon_info)

      get :show, params: { id: 1 }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq(pokemon_info)
    end

    it 'returns a JSON response with an error message when Pokemon is not found' do
      error_message = { 'error' => 'Pokemon not found' }
      allow(RestClient).to receive(:get).and_raise(RestClient::ExceptionWithResponse.new('Not Found', 404))

      get :show, params: { id: 'nonexistent_pokemon' }

      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to eq(error_message)
    end
  end
end
