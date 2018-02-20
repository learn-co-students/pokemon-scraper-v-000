class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(pokemon, hp=nil)
    @id   = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db   = pokemon[:db]
    @hp   = hp
  end
  
  def self.find(id, db)
    found   = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    pokemon = {id: found[0], name: found[1], type: found[2], db: db}
    pokemon.size == 4 ? Pokemon.new(pokemon,found[3]) : Pokemon.new(pokemon)
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", new_hp, self.name)
  end

end
