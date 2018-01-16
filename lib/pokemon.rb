class Pokemon
attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

#saves an instance of a pokemon with the correct id
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

#finds a pokemon from the database by their id number and returns a new Pokemon object
  def self.find(id_number, db)
    new_pokemon = db.execute(" SELECT * FROM pokemon WHERE id=?", id_number).flatten
    Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db)
  end

end#ofclass
