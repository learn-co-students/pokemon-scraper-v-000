class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(pokemon_hash)
    @id = pokemon_hash['id'] 
    @name = pokemon_hash['name'] 
    @type = pokemon_hash['type'] 
    @db = pokemon_hash['db'] 
    @hp = pokemon_hash['hp']  
    @@all << self 
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end 
  
  def self.all
    @@all 
  end 
  
  def self.find(id, db)
    found_pokemon_specs = (db.execute("SELECT * FROM pokemon WHERE id = ?;", id)).flatten

    name = found_pokemon_specs[1]
    type = found_pokemon_specs[2]
    hp = found_pokemon_specs[3]

    pokemon_hash = {}
    
    pokemon_hash['id'] = id 
    pokemon_hash['name'] = name 
    pokemon_hash['type'] = type 
    pokemon_hash['db'] = db
    pokemon_hash['hp'] = hp
    
    new_pokemon = Pokemon.new(pokemon_hash)
  end
  
  #BONUS
  def alter_hp(new_hp, db)
    self.hp = new_hp
    update_hp = (db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", hp, self.id))
  end 
end