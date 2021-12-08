module PokeapiServices
  class ApplicationService
    def parse(resource, page = 1)
      PokeApi.get("#{resource}": { limit: 100, page: page })
    end

    def parse_item(poke_api_resource_object)
      poke_api_resource_object.get
    end
  end
end
