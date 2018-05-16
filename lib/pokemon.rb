require 'pry'

class Pokemon

attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type) #passes
  end

  # def self.find(id, db) # undefined method `id' for nil:NilClass
  # def self.find(:id, db) #syntax error, unexpected tSYMBEG, expecting ')' (SyntaxError)
  # def self.find(id:, db) # syntax error, unexpected tIDENTIFIER
  # def self.find(id, db)
  def self.find(id, db)
    pok = db.execute("SELECT * FROM pokemon WHERE pokemon.id = 1;")
    # binding.pry
    i = pok[0][0]
    n = pok[0][1]
    t = pok[0][2]
    # new_pokemon = Pokemon.new(id:, name:, type:, db:) # syntax error, unexpected ',' (SyntaxError)
    # new_pokemon = Pokemon.new # missing keywords: id, name, type, db
    new_pokemon = Pokemon.new(i, n, t, db)
    # new_pokemon.id = pok[0]
    # new_pokemon.name = pok[1]
    # new_pokemon.type = pok[2]
    new_pokemon
  end
end
