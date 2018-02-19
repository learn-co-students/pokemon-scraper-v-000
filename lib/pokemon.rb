require 'pry'

class Pokemon
  attr_accessor :name, :type, :id, :db

  @@all = []

  def initialize(pokemon_hash)
    pokemon_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    poke_array = db.execute("SELECT name, type, id FROM pokemon WHERE id = #{id}")
    pokemon_hash = Hash.new
    pokemon_hash["name"] = poke_array[0][0]
    pokemon_hash["type"] = poke_array[0][1]
    pokemon_hash["id"] = poke_array[0][2]
    pokemon_hash["db"] = db
    Pokemon.new(pokemon_hash)
  end



end
