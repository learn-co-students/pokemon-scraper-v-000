class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type)
      VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT pokemon.id, pokemon.name, pokemon.type
      FROM pokemon WHERE pokemon.id = id")
  end

# not sure if this UPDATE statement will work. Will check with solution.
  def self.alter_hp(new_hp)
    db.execute("UPDATE pokemon SET pokemon.hp = new_hp WHERE pokemon.name = self.name")
  end

end
