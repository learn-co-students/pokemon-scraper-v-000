class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: id, name: name, type: type, db: db, hp: nil)
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
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id ).flatten
    self.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end

  def alter_hp(hp = 60, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ? ;", hp, self.id)
  end
end
