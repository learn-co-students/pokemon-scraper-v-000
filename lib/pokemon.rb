require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
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
    found_pokemon = (db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)).flatten
    # binding.pry
    self.new(id:found_pokemon[0], name:found_pokemon[1], type:found_pokemon[2], db:db, hp:found_pokemon[3])
  end

  def alter_hp(damaged_hp, db)
    # binding.pry
    db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.name = ?", damaged_hp, self.name)
  end

end
