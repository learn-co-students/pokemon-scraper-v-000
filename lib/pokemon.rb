class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize (id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.find (pokemon_id, database)
    pokemon_from_db = database.execute("SELECT * FROM pokemon WHERE id = ?", pokemon_id).flatten
    Pokemon.new(id: pokemon_from_db[0], name: pokemon_from_db[1], type: pokemon_from_db[2], hp: pokemon_from_db[3], db: database)
  end

  def self.save (name, type, database)
    database.execute("INSERT INTO pokemon(name, type) VALUES(?,?)", name, type)
  end

  def alter_hp (new_hp, database)
    database.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, @id)
  end
end
