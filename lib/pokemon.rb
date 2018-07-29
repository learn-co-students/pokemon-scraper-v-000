require 'pry'

class Pokemon
  attr_accessor :id, :hp, :name, :type, :db

  def initialize(id: nil, hp: nil, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
    # more elegant:
    # @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT id, name, type, hp FROM pokemon WHERE pokemon.id = ?", [id]).flatten
    Pokemon.new(id: id, hp: pokemon[3], name: pokemon[1], type: pokemon[2], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.id = ?", [new_hp, @id])
  end
end
