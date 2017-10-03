require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id

  @@all=[]

  def initialize(db)
    self.db = db
    self.id = id
    self.name = name
    self.type = type
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", @id, name, type )
  end

  def self.find(id, db)
    pokemon_info = db.execute("SELECT * from pokemon WHERE id = ?", id).flatten
    self.new(db).tap do |pokemon|
      pokemon.id = pokemon_info[0]
      pokemon.name = pokemon_info[1]
      pokemon.type = pokemon_info[2]
      # binding.pry
    end
    end

end
