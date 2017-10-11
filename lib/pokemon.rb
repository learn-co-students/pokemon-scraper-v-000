class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id=nil, name=nil, type=nil, hp=nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)

  end

  def self.find(id, db)
    pokemon_name_by_id = db.execute("SELECT * FROM pokemon WHERE pokemon.id= ?;", id).flatten
    # binding.pry
    new_pokemon = Pokemon.new(pokemon_name_by_id[0], pokemon_name_by_id[1], pokemon_name_by_id[2], pokemon_name_by_id[3])
    # binding.pry
  end

  def alter_hp(new_hp, db)
    self.hp = new_hp
    db.execute("UPDATE pokemon SET hp= ? WHERE name = ?", @hp, self.name)
  end
end
