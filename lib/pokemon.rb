class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id=nil, pk_name=nil, pk_type=nil, db=nil)
    @id = id
    @name = pk_name
    @type = pk_type
    @db = db
  end

  def self.save(pk_name, pk_type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", pk_name, pk_type)

  end

  def self.find(id, db)
    pokemon_name_by_id = db.execute("SELECT * FROM pokemon WHERE pokemon.id= ?;", id).flatten
    new_pokemon = Pokemon.new(pokemon_name_by_id[0], pokemon_name_by_id[1], pokemon_name_by_id[2])

  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp= ?", hp)
  end
end
