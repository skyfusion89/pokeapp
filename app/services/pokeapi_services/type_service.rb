module PokeapiServices
  class TypeService < ApplicationService
    def parse_list(page = 1)
      parse('type', page)
    end
  end
end
