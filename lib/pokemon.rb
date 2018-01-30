class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: nil, name: nil, type: nil, db: nil, hp: nil)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    self.hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_1 = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon_1[0], name: pokemon_1[1], type: pokemon_1[2], db: db, hp: pokemon_1[3])
  end

  def alter_hp(altered_hp, db)
    self.hp = altered_hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", self.hp, self.id)
  end

end
