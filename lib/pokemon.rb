
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    pokemon_information = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon_information[0], name: pokemon_information[1], type: pokemon_information[2], hp: pokemon_information[3], db: db)
  end

  def alter_hp(new_health_power, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_health_power, self.id)
  end

end
