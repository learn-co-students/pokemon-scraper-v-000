require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id)
    @id = id
    @name = name
    @type = type
    @db = db
    # @@all << self
  end

  def self.save(name, type, db) #db is a class that is passed in
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type) #the last 2 values are what are passed
    #into the ??
  end

  # def self.all
  #   @@all
  # end

  def self.find(id, db)
    # pokemon = db.execute("SELECT pokemon.name, pokemon.type FROM pokemon WHERE pokemon.id = ?", id).flatten[0]
    # @@all.detect {|poke_obj| poke_obj.name = pokemon}
    pokemon = db.execute("SELECT pokemon.id, pokemon.name, pokemon.type FROM pokemon WHERE pokemon.id = ?", id).flatten
    new_poke = self.new(pokemon[0])
    # binding.pry
    new_poke.name = pokemon[1]
    new_poke.type = pokemon[2]
    new_poke.db = db
    new_poke
  end
end
