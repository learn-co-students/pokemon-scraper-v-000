require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id: nil, name: nil, type: nil, db: nil)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = id ")
    new_pokemon = pokemon.flatten
    # binding.pry
    Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2])
  end

end
