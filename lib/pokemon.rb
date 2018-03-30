class Pokemon
  
  attr_accessor :name, :type, :db, :id, :hp

  
  def initialize (pokemon)

    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @hp = pokemon[:hp]
    
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find (id, db)
    # The find method creates a new Pokemon after selecting their row from the database by their id number.

    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
    
  end
  
  def alter_hp (hp, db)
    db.execute("UPDATE pokemon SET hp = ?", hp)
  end
  
end
