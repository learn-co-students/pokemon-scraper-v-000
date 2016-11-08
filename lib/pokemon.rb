require "pry"
class Pokemon
  attr_accessor :name,:type,:db, :id
  def initialize(pokemon_hash)
    @id=pokemon_hash[:id]
    @name=pokemon_hash[:name]
    @type=pokemon_hash[:type]
    @db=pokemon_hash[:db]
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, database_connection)
    pokemon_hash={}
    pokemon = database_connection.execute("SELECT * FROM POKEMON where id = ?", id.to_i)
    binding.pry
    pokemon_hash[:id]=pokemon[0][0]
    pokemon_hash[:name]=pokemon[0][1]
    pokemon_hash[:type]=pokemon[0][2]
    pokemon_hash[:db]=database_connection
    Pokemon.new(pokemon_hash)
  end
end
