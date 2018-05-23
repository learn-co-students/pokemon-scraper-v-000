class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize( id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    pokemon_search = db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", id).flatten
    Pokemon.new(id: pokemon_search[0], name: pokemon_search[1], type: pokemon_search[2], hp: pokemon_search[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
