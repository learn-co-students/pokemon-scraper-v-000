class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: id, name: name, type: type, hp: hp, db: db)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke_obj = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    pokemon = Pokemon.new(id: poke_obj[0], name: poke_obj[1], type: poke_obj[2], hp: poke_obj[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
  end

end
