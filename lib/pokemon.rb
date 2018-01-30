require_relative '../bin/sql_runner.rb'

class Pokemon
  attr_accessor :db, :name, :type, :id

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", @id, name, type)
  end

  def self.find(id, db)
   pokemon = db.execute("SELECT pokemon.id, pokemon.name, pokemon.type FROM pokemon WHERE id = ? LIMIT 1", id)
   pokemon[0]
  end
end
