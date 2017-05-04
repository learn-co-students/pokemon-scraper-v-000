class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id, @name, @type = id, name, type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)

  end

  def self.find(id, db)
    pokemon_is_dumb = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    Pokemon.new(id: pokemon_is_dumb[0], name: pokemon_is_dumb[1], type: pokemon_is_dumb[2], db: db)
  end
end
