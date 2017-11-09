class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  def initialize(id: , name: , type: , db:, hp: nil)
    @id = id
    @hp = hp
    @name = name
    @type = type
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name, type)
  end

  def self.find(id, db)
    pokemon_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    new_poke = Pokemon.new(id: pokemon_data[0],name: pokemon_data[1],type: pokemon_data[2], hp: pokemon_data[3], db: db)
    new_poke
  end

  def alter_hp(new_value, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_value, self.id)
  end
end
