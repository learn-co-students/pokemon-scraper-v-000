require "pry"

class Pokemon
  attr_accessor :name, :id, :type, :db, :hp

  @@all = []

  def initialize(name, id = nil, type = nil, hp = 60, db = nil)
    @name = name
    @id = id
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_from_db = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(pokemon_from_db[1], pokemon_from_db[0], pokemon_from_db[2], pokemon_from_db[3])
  end

  def alter_hp(update_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", update_hp, self.id)
  end

end
