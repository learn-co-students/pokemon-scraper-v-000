require 'pry'
require 'sqlite3'

class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(db)
    @id = db[:id]
    @name = db[:name]
    @type = db[:type]
    @db = db
    @@all << self
  end

  def self.save(name, type, db_connection)
    db_connection.execute("INSERT INTO pokemon (name, type)
    VALUES (?, ? )", [name, type])
  end

  def self.all
    @@all
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT *
      FROM pokemon
      WHERE pokemon.id = ?", id).flatten

    Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db)
  end


end
