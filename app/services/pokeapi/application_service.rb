class ApplicationService
  def parse(resource_name, page = 1)
    PokeApi.get("#{resource_name}": { limit: 100, page: page })
  end

  def parse_item(poke_api_resource_object)
    poke_api_resource_object.get
  end
end
