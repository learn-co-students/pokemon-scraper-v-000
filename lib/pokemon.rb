class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id)
    @id = id
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
  end

  def self.find(id, db)

    pokemon = db.execute("SELECT * FROM pokemon WHERE id = (#{id})")

    new_pokemon = self.new(id)
    new_pokemon.name = pokemon[0][1]
    new_pokemon.type = pokemon[0][2]
    new_pokemon
  end

  def alter_hp(new_hp, db)
    self.hp = new_hp
  end
end
