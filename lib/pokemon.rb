class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: hp)
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
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], hp: new_pokemon[3], db: db)

    # pokemon_name = db.execute("SELECT name FROM pokemon WHERE id = ?", id).flatten[0]
    # pokemon_type = db.execute("SELECT type FROM pokemon WHERE id = ?", id).flatten[0]
    # pokemon_hp = db.execute("SELECT hp FROM pokemon WHERE id = ?", id).flatten[0]
    # pokemon = Pokemon.new(id: id, name: pokemon_name, type: pokemon_type, hp: pokemon_hp, db: db)
    # binding.pry
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp =? WHERE id =?", hp, self.id)
  end
end
