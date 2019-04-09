require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id = nil, name = nil, type = nil, db = nil, hp = nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    new_pokemon_name = db.execute("SELECT name FROM pokemon WHERE id = ?",id)[0][0]
    new_pokemon_type = db.execute("SELECT type FROM pokemon WHERE id = ?",id)[0][0]
    Pokemon.new(id, new_pokemon_name, new_pokemon_type)
  end

  def alter_hp(mod_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",mod_hp, self.id)
  end
end
