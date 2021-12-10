class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.includes(:types).all
    response = JSONAPI::Serializer.serialize(
      @pokemons, {
        fields: {
          pokemons: [:name, :types]
          },
        is_collection: true
      }
    )
    render json: response
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    response = JSONAPI::Serializer.serialize(@pokemon)
    render json: response
  end
end
