require 'pry'

class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp 
  
  @@all = []
  
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db 
    @hp = hp 
    @@all << self 
  end
  
  def self.save(name, type, db) 
    
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", [name, type])
    
  end 
  
  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", [id])
    pokemon_object = Pokemon.new(id: id, name: new_pokemon[0][1], type: new_pokemon[0][2], db: db) 
  end 
  
  def alter_hp(new_hp, db)
    self.hp = new_hp
  end
  
end


