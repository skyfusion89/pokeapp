class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :base_experience
      t.integer :weight
      t.integer :height
      t.boolean :is_default

      t.timestamps
    end
  end
end
