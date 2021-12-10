require 'rails_helper'

RSpec.describe PokeapiServices::PokemonService do
  subject { described_class.new.parse_list }
  let(:pokemon_response) { file_fixture('pokemon.json').read }
  it 'returns json object' do
    stub_request(:get, 'https://pokeapi.co/api/v2/pokemon/?limit=100&offset=0')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Host' => 'pokeapi.co',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: pokemon_response, headers: {})

    expect(subject.results).to be_a Array
    expect(subject.results.first).to respond_to(:name)
  end
end
