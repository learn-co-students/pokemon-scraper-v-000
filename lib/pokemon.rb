class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(pokemon, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",pokemon, type)
  end

  def self.find(id, db)
    pokemon_info = {}
    db_return = db.execute("SELECT * FROM pokemon WHERE id = ?",id).flatten
    pokemon_info[:id] = db_return[0]
    pokemon_info[:name] = db_return[1]
    pokemon_info[:type] = db_return[2]
    pokemon_info[:hp] = db_return[3]
    pokemon_info[:db] = db
    Pokemon.new(pokemon_info)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", hp, self.name)
  end

end
