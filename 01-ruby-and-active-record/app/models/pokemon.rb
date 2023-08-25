require 'json'
require 'rest-client'
require 'sinatra/activerecord'

class Pokemon < ActiveRecord::Base

  # add your associations and methods here
  belongs_to :player

  def attack
    self.damage + rand(-10..10)

    # min = damage - 10
    # max = damage + 10
    # rand(min..max)
  end

  # foreign_damage = attack from another pokemon
  def take_damage(foreign_damage)
    # rand(defence)
    incoming_damage = foreign_damage - rand(defence)
    self.health = health - incoming_damage
    self.health = 0 if health.negative?
  end
  # speed is 0 .. 180
  def miss?
    rand(200) < speed
  end

  def ko?
    # if health.zero?
    #   true
    # elsif health.positive?
    #   false
    # end
    health.zero?
  end

  # class method
  def self.locate_stat(stats_hash, key)
    stat = stats_hash.find{ |hash| hash['stat']['name'] == key }
    stat['base_stat']
  end

  def self.details(name)
    #   # call api
    #   # set hash attributes

    url = "https://pokeapi.co/api/v2/pokemon/#{name}"
    response = JSON.parse(RestClient.get(url))
    stats = response['stats']

    {
      name: name,
      health: locate_stat(stats, 'hp'),
      damage: locate_stat(stats, 'attack'),
      defence: locate_stat(stats, 'defense'),
      speed: locate_stat(stats, 'speed'),
      image: response['sprites']['front_default']
    }
  end
end

# stats.find = find the first item that matches
