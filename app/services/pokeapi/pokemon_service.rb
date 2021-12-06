class PokemonService < ApplicationService
  def parse_list(page = 1)
    parse('pokemon', page)
  end

  def parse_item(poke_api_resource_object)
    poke_api_resource_object.get
  end
end
