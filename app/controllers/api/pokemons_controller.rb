# frozen_string_literal: true

class Api::PokemonsController < ApplicationController

  def show
    pokemon_info = PokemonService.get_info(params[:id])
    if pokemon_info.key?(:error)
      render json: { error: "Pokemon not found" }, status: :not_found
    else
      render json: pokemon_info
    end
  end
end
