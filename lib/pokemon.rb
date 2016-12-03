class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize (id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    hp == nil ? @hp = 60 : @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = (?)", id)
    pokemon = Pokemon.new(id: poke[0][0], name: poke[0][1], type: poke[0][2], db: db, hp: poke[0][3])
    return pokemon
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE name = (?)", new_hp, self.name)
  end

end
