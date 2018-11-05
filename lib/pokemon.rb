class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  @@all = []
  
  def initialize(keywords)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end
 
  # def self.all
  #   @@all
  # end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(numb, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", numb)
    new_pokemon = self.new(pokemon)
    new_pokemon.id = pokemon[0][0]
    new_pokemon.name = pokemon[0][1]
    new_pokemon.type = pokemon[0][2]
    new_pokemon.hp = pokemon[0][3]
    return new_pokemon
  end
  
  def alter_hp(numb, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [numb], [self.id])
    self.hp = numb
  end
end