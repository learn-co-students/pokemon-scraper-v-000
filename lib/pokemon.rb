class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    self.new(pokemon_info[0], pokemon_info[1], pokemon_info[2], db)
  end

  def alter_hp(new_hp)
    db.execute("UPDATE pokemon SET hp = ?", new_hp)
  end
end
