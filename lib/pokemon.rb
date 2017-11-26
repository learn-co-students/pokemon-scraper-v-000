require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id: , name: , type: , db: )
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    pokemon = db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    @@all << pokemon
  end

  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
    Pokemon.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], db: db)
  end


end
