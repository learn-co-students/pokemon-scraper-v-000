class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id)
    @id = id
    self.hp = 60
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
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
