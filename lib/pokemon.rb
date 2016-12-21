require 'pry'

class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db

  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon")
    pokemon = {:id => new_pokemon[0][0], :name => new_pokemon[0][1], :type => new_pokemon[0][2], :db => db}
    Pokemon.new(pokemon)
  end


end
