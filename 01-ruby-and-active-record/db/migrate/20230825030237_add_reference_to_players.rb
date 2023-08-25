class AddReferenceToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_reference :players, :game, foreign_key: true
  end
end
