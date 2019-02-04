require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(id:, name:, hp: nil, type:, db:)
    @id = id
    @name = name
    @hp = hp
    @type = type
    @db = db

    @@all << self
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)

  end

  def self.find(id, database_connection)
    pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pokemon[1]
    type = pokemon[2]
    hp = pokemon[3]

    new_poke = Pokemon.new(id: id, name: name, hp: hp, type: type, db: database_connection)

  end

  def alter_hp(update_hp, database_connection)
    database_connection.execute("UPDATE pokemon
    SET hp = ?
    WHERE id = ?", update_hp, @id)
  end

end
