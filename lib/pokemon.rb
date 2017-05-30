class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize (hp = nil)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find (pokemon_id, database)
    new_pokemon = Pokemon.new
    pokemon_from_db = database.execute("SELECT * FROM pokemon WHERE id = ?", pokemon_id).flatten
    new_pokemon.id = pokemon_from_db[0]
    new_pokemon.name = pokemon_from_db[1]
    new_pokemon.type = pokemon_from_db[2]
    new_pokemon.hp = pokemon_from_db[3] if pokemon_from_db.length == 4
    new_pokemon
  end

  def self.save (name, type, database)
    database.execute("INSERT INTO pokemon(name, type) VALUES(?,?)", name, type)
  end

  def alter_hp (new_hp, database)
    database.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, @id)
  end
end
