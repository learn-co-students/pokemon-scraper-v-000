class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(name = "", type = "", id = "", db = "")
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten

    pokemon_id = found_pokemon[0]
    pokemon_name = found_pokemon[1]
    pokemon_type = found_pokemon[2]
    new_pokemon = Pokemon.new(pokemon_name, pokemon_type, pokemon_id, db)
  end

end
