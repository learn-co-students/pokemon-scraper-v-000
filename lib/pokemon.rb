require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = nil
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, database_connection)
    pokemon_info = database_connection.execute("SELECT * FROM pokemon WHERE id=?",id).flatten
    Pokemon.new({id: pokemon_info[0], name: pokemon_info[1],type: pokemon_info[2], db: pokemon_info[3]})
  end

  def alter_hp(hp, database_connection)
    binding.pry 
    database_connection.execute("UPDATE pokemon SET hp = ? WHERE id = ?",hp, id)
  end

end
