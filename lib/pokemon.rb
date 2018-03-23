class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(id: nil, name: nil, type: nil, db: nil, hp: nil)
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
    @@all << self
  end

  def self.find(id, db)
    pokemon_data = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    Pokemon.new(id: id, name: pokemon_data[1], type: pokemon_data[2], hp: pokemon_data[3], db: db)
  end

  def alter_hp(altered_hp, db)
    hp = altered_hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ? ", altered_hp, id)
  end

end
