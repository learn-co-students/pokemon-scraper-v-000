class Pokemon

  @@all = []

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id, @name, @type, @db = id, name, type, db
    @@all << self
  end

  def self.save(pokemon_name, pokemon_type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", pokemon_name, pokemon_type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
  end

end
