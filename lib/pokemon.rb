require 'pry'
require 'sqlite3'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(db)
    @id = db[:id]
    @name = db[:name]
    @type = db[:type]
    @db = db
    @hp = db[:hp] unless db[:hp].nil?
    @@all << self
  end

  def self.save(name, type, hp = nil, db_connection)
    db_connection.execute("INSERT INTO pokemon (name, type)
    VALUES (?, ?)", name, type)
  end

  def self.all
    @@all
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT *
      FROM pokemon
      WHERE pokemon.id = ?", id).flatten

    Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], hp: new_pokemon[3], db: db)
  end

  def alter_hp(remaining_hp, db)
    db.execute("UPDATE pokemon 
    SET hp = (?) 
    WHERE name = (?);", remaining_hp, self.name)
  end


end
