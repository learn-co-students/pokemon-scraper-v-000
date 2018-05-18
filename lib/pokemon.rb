class Pokemon
attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db =db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", [name, type])
  end

  def self.find(id, db)
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten;

    new_pokemon = Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: db)
  end

end

#   .find
#     finds a pokemon from the database by their id number and returns a new Pokemon object (FAILED - 3)
