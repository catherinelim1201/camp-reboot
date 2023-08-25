class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :health
      t.integer :damage
      t.integer :defence
      t.integer :speed
      t.string :image
      t.timestamps
    end
  end
end
