require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.find(id, db)
    pokemon_from_db = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    self.new(id: pokemon_from_db[0], name: pokemon_from_db[1], type: pokemon_from_db[2], db: db, hp: pokemon_from_db[3])
  end
  # What if array is ["Pokemon name", "Pokemon type"] and is missing an element?

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def alter_hp(updated_hp, db)
    # binding.pry
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", updated_hp, self.id)
  end
end
