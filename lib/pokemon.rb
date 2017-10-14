class Pokemon
  attr_accessor :name, :type, :db, :id

  db = SQLite3::Database.new('db/pokemon.db')

  def initialize(id = nil, name = nil, type = nil, db = nil, hp = nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def hp
    @hp
end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) values (?, ?)', [name, type])
  end

  def self.find(id, db)
    pokemon = db.execute('SELECT * FROM pokemon WHERE pokemon.id = ?', id)
    pokemon_id = pokemon[0][0]
    pokemon_name = pokemon[0][1]
    pokemon_type = pokemon[0][2]
    pokemon_hp = pokemon[0][3]
    Pokemon.new(pokemon_id,pokemon_name, pokemon_type, @db, pokemon_hp)
  end

  def alter_hp(hp, db)
    db.execute('UPDATE pokemon SET hp = ?', hp)
  end
end
