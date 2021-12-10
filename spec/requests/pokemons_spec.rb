require 'rails_helper'

RSpec.describe "Pokemons", type: :request do
  describe "GET /index" do
    let(:pokemon_1) { FactoryBot.create(:pokemon) }
    before do
      pokemon_1
    end

    it 'returns http success' do
      get '/pokemons'
      expect(response).to have_http_status(:success)
      expect(response.header['Content-type']).to include('application/json')
    end

    it 'renders attributes' do
      get '/pokemons'
      pokemons = JSON.parse(response.body, symbolize_names: true)
      expect(pokemons[:data].first).to have_key(:id)
      expect(pokemons[:data].first).to have_key(:attributes)
      expect(pokemons[:data].first).to have_key(:relationships)
      expect(pokemons[:data].first[:relationships]).to have_key(:types)
    end
  end

  describe "GET /show" do
    let(:pokemon_2) { FactoryBot.create(:pokemon) }
    before do
      pokemon_2
    end

    it 'returns http success' do
      get '/pokemons'
      expect(response).to have_http_status(:success)
      expect(response.header['Content-type']).to include('application/json')
    end

    it "renders attributes" do
      get "/pokemons/#{pokemon_2.id}"
      pokemon = JSON.parse(response.body, symbolize_names: true)
      expect(pokemon[:data]).to have_key(:id)
      expect(pokemon[:data]).to have_key(:attributes)
    end
  end

end
