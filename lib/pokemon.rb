require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(name)
    @name = name
    @type = type
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type,)
  end

  def self.find(id, database_connection)
    new_pokemon = database_connection.execute("SELECT * FROM pokemon WHERE pokemon.id = id")
    pokemon = self.new(new_pokemon[0][1])
    pokemon.type = new_pokemon[0][2]
    pokemon.id = new_pokemon[0][0]
    pokemon.db = database_connection
    pokemon
  end

  def BONUS
  "ALTER TABLE pokemon ADD hp INTEGER;"
  end


end
