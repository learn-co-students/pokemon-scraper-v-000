class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize (name:, type:, db:, id: nil, hp: nil)
  @id = id
  @name = name
  @type = type
  @db = db
  @hp = hp 
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    pokemon_database = (db.execute("SELECT * FROM pokemon WHERE id = (?)", id)).flatten
    new_pokemon = Pokemon.new(id: pokemon_database[0], name: pokemon_database[1], type: pokemon_database[2], db: db)
  end

  def alter_hp(hp, db)
   db.execute( "UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
  end
end
