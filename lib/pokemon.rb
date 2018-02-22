class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(id = nil, name = nil, type = nil, hp = nil, db)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end

  def self.save(name, type, db) # use to insert into database
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", [@id, name, type])
  end

  def self.find(id, db)
    # 1. finds a pokemon from the database by their id number
    creature_array = db.execute("SELECT * FROM pokemon WHERE pokemon.id = id;")
    # 2. creates and returns a new Pokemon object
    creature_array.each do |pokemon|
      @new_pokemon_object = Pokemon.new(pokemon[0], pokemon[1], pokemon[2], pokemon[3], db)
    end
    @new_pokemon_object
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET (hp) = (?)", [hp])
  end

  def self.all
    @@all
  end

end
