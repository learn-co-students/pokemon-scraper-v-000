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
    sql = db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?)")
    sql.execute(name, type)
  end

  def self.find(pokemon_id, db)
    sql = db.prepare("SELECT * FROM pokemon WHERE id = ?")
    pokemon_array = sql.execute(pokemon_id).next
    id = pokemon_array[0]
    name = pokemon_array[1]
    type = pokemon_array[2]
    hp = pokemon_array[3]
    Pokemon.new(id: id, name: name, type: type, db: db, hp: hp)
  end

  def alter_hp(new_hp, db)
    sql = db.prepare("UPDATE pokemon SET hp = ? WHERE id = ?")
    sql.execute(new_hp, @id)
  end
end
