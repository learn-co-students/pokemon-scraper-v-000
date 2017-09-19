class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(pokemon, hp = nil)
    @db = pokemon.fetch(:db)
    @name = pokemon.fetch(:name)
    @type = pokemon.fetch(:type)
    @id = pokemon.fetch(:id)
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES
    (?, ?)", name, type) if name && type
  end

  def self.find(id, db)
    pokemon = {}
    pokemon_values = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    pokemon[:id] = id
    pokemon[:name] = pokemon_values[1]
    pokemon[:type] = pokemon_values[2]
    pokemon[:db] = db
    Pokemon.new(pokemon, pokemon_values[3])
  end

  def alter_hp(hp_new, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp_new, self.id)
  end
end
