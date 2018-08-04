class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id = 1, name = "Pikachu", type = "electric", hp = nil, db = "db/db.db")
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokeinfo = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(pokeinfo[0], pokeinfo[1], pokeinfo[2], pokeinfo[3], db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", new_hp, self.id)
  end
end
