class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(id: nil, name: nil, type: nil, hp: nil, db: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    attributes = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    Pokemon.new(id: id, name: attributes[1], type: attributes[2], hp: attributes[3], db: db)
  end

  def alter_hp(new_hp, db)
    hp = new_hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ? ", new_hp, id)
  end

end
