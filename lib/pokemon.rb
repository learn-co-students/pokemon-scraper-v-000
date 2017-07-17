require "pry"
class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id: "default", name: "default", type: "default", db: "default")
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    pokemon_find = db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id)
    new_pokemon = self.new(
      id: pokemon_find[0][0],
      name: "#{pokemon_find[0][1]}",
      type: "#{pokemon_find[0][2]}"
      )
  end
end
