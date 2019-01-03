class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
    pokemon_id = pokemon_array[0]
    pokemon_name = pokemon_array[1]
    pokemon_type = pokemon_array[2]
    pokemon_db = db
    pokemon_hp = pokemon_array[3]
    new_pokemon = Pokemon.new(id: pokemon_id, name: pokemon_name, type: pokemon_type, db: pokemon_db, hp: pokemon_hp)
    new_pokemon
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", hp, @id)
  end
end
