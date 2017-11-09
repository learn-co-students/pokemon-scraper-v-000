class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  def initialize(id, hp = 60)
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name, type)
  end

  def self.find(id, db)
    pokemon_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    new_poke = Pokemon.new(id)
    new_poke.name = pokemon_data[1]
    new_poke.type = pokemon_data[2]
    new_poke
  end

  def alter_hp(new_value, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_value, self.id)
  end
end
