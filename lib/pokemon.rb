class Pokemon
  attr_accessor :name, :id, :type, :db, :hp
  @@all = []
  def initialize(id:, name:, type:, db:, hp: 60)
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

  def self.find(pokemon_id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?", pokemon_id)
    id = pokemon_array[0][0]
    name = pokemon_array[0][1]
    type = pokemon_array[0][2]
    hp = pokemon_array[0][3]
    Pokemon.new(id: id, name: name, type: type, db: db, hp: hp)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, @id)
  end
end
