class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id)
    self.name = name
    self.type = type
    self.db = db
    self.hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    find_pokemon = db.execute("SELECT * FROM pokemon
     WHERE id=?", id).flatten

     new_pokemon = Pokemon.new(find_pokemon[0])
     new_pokemon.id = find_pokemon[0]
     new_pokemon.name = find_pokemon[1]
     new_pokemon.type = find_pokemon[2]
     new_pokemon.hp = find_pokemon[3]

     return new_pokemon

  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
