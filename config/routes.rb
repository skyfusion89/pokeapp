Rails.application.routes.draw do
  get 'pokemons', to: 'pokemons#index'
  get 'pokemons/:id', to: 'pokemons#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
