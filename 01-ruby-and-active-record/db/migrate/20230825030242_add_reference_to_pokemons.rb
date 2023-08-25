class AddReferenceToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_reference :pokemons, :player, foreign_key: true
  end
end
