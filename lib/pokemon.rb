class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id, name, type, database)
    @id = id
    @name = name
    @db = db
    @type = type
  end

  def self.save(pika, chu, database)
    database.execute("INSERT INTO pokemon (name, type) VALUES ('#{pika}', '#{chu}');")
  end

  def self.find(id, database)
    database.execute("SELECT * FROM pokemon;")
  end

  # BONUS
  def self.alter_hp(new_hp)
    db.execute("UPDATE pokemon SET pokemon.hp = ? WHERE pokemon.id = ?", new_hp, id)
  end

end
