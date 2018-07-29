require 'pry'

class Pokemon
  attr_accessor :id, :hp, :name, :type, :db

  def initialize(id: nil, hp: nil, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT id, name, type FROM pokemon WHERE pokemon.id = ?", [id])
    pokemon = pokemon.flatten
    name = pokemon[1]
    type = pokemon[2]
    Pokemon.new(id: id, hp: 60, name: name, type: type, db: db)
  end
end
