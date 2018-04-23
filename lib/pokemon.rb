require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id
  @@all = []
  def initialize(db)
    @db = db
    @name = name
    @type = type
    @@all << self
  end

  def self.save(name, type, db)
    pokemon = self.new(db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    pokemon_arr = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    pok = self.save(pokemon_arr[1], pokemon_arr[2], db)
    pok
    # @@all.each |pokemon| Pokemon.save(pokemon.name,pokemon.type,db)
    # binding.pry
  end

end
