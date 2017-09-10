class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp: nil, db:)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    self.hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2],hp: pokemon[3], db: pokemon[4])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end
