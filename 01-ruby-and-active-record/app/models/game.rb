class Game < ActiveRecord::Base
  # add your associations and methods here
  has_many :players
end
