class PokemonSerializer
  include JSONAPI::Serializer

  attribute :name
  attribute :base_experience
  attribute :weight
  attribute :height
  attribute :is_default

  has_many :types, include_data: true
end
