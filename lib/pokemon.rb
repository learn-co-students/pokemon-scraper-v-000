require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :healthpower

  @@all = []

  def initialize(db)
    @db = db
    @name = name
    @type = type
    @healthpower = healthpower
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    pokemon = self.new(db)
    pokemon.id = result[0][0]
    pokemon.name = result[0][1]
    pokemon.type = result[0][2]
    pokemon.healthpower = result[0][3]
    pokemon
  end

  def alter_hp(hp, db)
    Pokemon.find(self.id, db).healthpower = hp
  end

end
