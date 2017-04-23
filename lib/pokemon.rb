class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(id)
    @id = id
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
    #db.execute("UPDATE pokemon SET hp = 60 WHERE name = #{name}")
  end

  def self.find(id, db)
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = (#{id})")
    new_pokemon = self.new(id)
    new_pokemon.name = found_pokemon[0][1]
    new_pokemon.type = found_pokemon[0][2]
    new_pokemon
  end

  def alter_hp(hp)
    @hp = hp
  end

end
