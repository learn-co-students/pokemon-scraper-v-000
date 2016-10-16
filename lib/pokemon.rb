class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = 0
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    db.execute("SELECT pokemon.id, pokemon.name, pokemon.type FROM pokemon WHERE pokemon.id = ?", id_num)
  end

  def alter_hp(new_hp)
    @db.execute("UPDATE TABLE pokemon SET pokemon.hp = new_hp", new_up)
  end
end
