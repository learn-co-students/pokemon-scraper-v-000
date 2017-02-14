require 'pry'

@@all = []

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @@all << self
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, database_connection)
    array = database_connection.execute("SELECT * FROM pokemon WHERE id = (?);",id).flatten
    pokemon_obj = {
      id: array[0],
      name: array[1],
      type: array[2]
    }
    self.new(pokemon_obj)
  end

end
