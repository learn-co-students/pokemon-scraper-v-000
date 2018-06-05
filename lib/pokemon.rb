require 'pry'
class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  
  @@all = []
  
  def initialize (id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name 
    @type = type 
    @db = db
    @hp = hp
  end
  
  def self.save(name, type, db) 
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
    @@all << self
  end
  
  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE pokemon.id = #{id}").flatten
    name = pokemon_array[1]
    type = pokemon_array[2]
    hp = pokemon_array[3]
    Pokemon.new(id: id, name: name, type: type, db: db, hp: hp)
  end
  
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = '#{hp}' WHERE name = '#{self.name}'")
  end
  
end
