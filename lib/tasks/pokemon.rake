namespace :pokemon do
  desc 'Import Pokemon Data from Poke API'
  task :import => :environment do
    page = 1
    while(response = PokeapiServices::PokemonService.new.parse_list(page).results)
      break unless response.any?

      response.each do |pokemon_object|
        temp_pokemon = pokemon_object.get
        puts "#{temp_pokemon.name} | #{temp_pokemon.url}"
        pokemon = Pokemon.find_or_create_by(name: temp_pokemon.name)
        pokemon.update(
          name: temp_pokemon.name,
          height: temp_pokemon.height,
          weight: temp_pokemon.weight,
          base_experience: temp_pokemon.base_experience,
          is_default: temp_pokemon.is_default
        )
        temp_pokemon.types.each do |pokemon_type|
          type = Type.find_by(name: pokemon_type.type.name)

          Pokemon.find(pokemon.id).types.destroy_all
          pokemon.pokemon_types.find_or_create_by(pokemon_id: pokemon, type_id: type.id)
        end
      end
      page+=1
    end
  end
end
