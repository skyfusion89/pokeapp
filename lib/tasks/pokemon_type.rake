namespace :pokemon_type do
  desc 'Import Pokemon Type Data from Poke API'
  task :import => :environment do
    response = PokeapiServices::TypeService.new.parse_list.results
    response.each do |type|
      Type.find_or_create_by(name: type.name)
    end
  end
end
