class Pokemon
  #build methods
  attr_accessor :id, :name, :type, :db, :hp

  def initialize (args)
    #binding.pry
    @id = args[:id]
    @name = args[:name]
    @type = args[:type]
    @db = args[:db]
    @hp = args[:hp]

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    find_pokemon = db.execute("SELECT * FROM pokemon WHERE id == (?)", id)
    pokemon_id = find_pokemon[0][0]
    pokemon_name = find_pokemon[0][1]
    pokemon_type = find_pokemon[0][2]
    Pokemon.new(id: pokemon_id, name: pokemon_name, type: pokemon_type, db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
