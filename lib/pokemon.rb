class Pokemon
attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db= id, name, type, hp, db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end  
  
  def self.find(id, db)
    pokemon_is_dumb = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    Pokemon.new(id: pokemon_is_dumb[0], name: pokemon_is_dumb[1], type: pokemon_is_dumb[2], hp: pokemon_is_dumb[3], db: db)
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
    
end
