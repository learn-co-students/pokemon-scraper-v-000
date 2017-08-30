require "pry"
class Pokemon
   attr_accessor :name, :type, :db, :id, :hp
   @@all = []
  def initialize(id = nil, name = nil, type = nil, hp = 60, db)
    @hp = hp
    @name = name
    @type = type
    @db = db
    @id = id
    @@all << self

  end

  def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  def self.find(index, db)
    pokemon_data = db.execute("SELECT * FROM pokemon WHERE id = ?", index)[0]
    Pokemon.new(pokemon_data[0], pokemon_data[1], pokemon_data[2], pokemon_data[3], db)
  end
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.id = ?", hp, self.id)
  end

end
