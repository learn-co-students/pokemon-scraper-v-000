require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = nil
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, database_connection)
    pokemon_info = database_connection.execute("SELECT * FROM pokemon WHERE id=?",id).flatten
    Pokemon.new(pokemon_info[0], pokemon_info[1], pokemon_info[2])
  end

end
