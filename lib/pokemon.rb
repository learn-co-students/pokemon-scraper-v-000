class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id = nil, name = nil, type = nil, hp = nil, db = nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_number, db)
    instance = db.execute("SELECT * FROM pokemon WHERE id = ?", id_number).flatten
    Pokemon.new(id = instance[0], name = instance[1], type = instance[2], hp = instance[3], db = db)
  end

  def alter_hp(health, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", health, self.id)
  end
end
