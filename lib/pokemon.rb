class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(db, hp = nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name, type)
  end

  def self.find(key_id, db)
    pokemon_found = db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", key_id)
    pokie = self.new(db)
    pokie.id = pokemon_found[0][0]
    pokie.name = pokemon_found[0][1]
    pokie.type = pokemon_found[0][2]
    pokie.hp = pokemon_found[0][3]
    pokie
  end

  def alter_hp(damage, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE name = (?)", damage, self.name)
  end

end
