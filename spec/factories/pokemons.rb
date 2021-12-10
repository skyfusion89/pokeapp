FactoryBot.define do
  factory :pokemon do
    name { 'Pikachu' }
    height { 0.4 }
    weight { 6 }
    base_experience { 82 }
    is_default { true }
    after(:create) do |pokemon|
      type = FactoryBot.create(:type)
      type.name = 'ice'
      pokemon.pokemon_types.create(type_id: type.id)
    end
  end
end
