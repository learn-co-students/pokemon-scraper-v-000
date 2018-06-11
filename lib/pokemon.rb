class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, database_connection)
    pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    pokemon_id = pokemon[0]
    pokemon_name = pokemon[1]
    pokemon_type = pokemon[2]
    pokemon_hp = pokemon[3]
    pokemon_db = database_connection

    #binding.pry
    Pokemon.new(id: pokemon_id, name: pokemon_name, type: pokemon_type, hp: pokemon_hp, db: pokemon_db)
  end

  def alter_hp(new_hp, database_connection)
    database_connection.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
