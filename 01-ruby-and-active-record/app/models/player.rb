class Player < ActiveRecord::Base
  # add your associations and methods here
  has_many :pokemons
  belongs_to :game
end
