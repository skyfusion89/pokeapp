module PokeapiServices
  class PokemonService < ApplicationService
    def parse_list(page = 1)
      parse('pokemon', page)
    end
  end
end
