class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id, name, type, db, hp = nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db = @db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db = @db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
  end

  def knows_default_hp(db = @db)
    db.execute("SELECT hp FROM pokemon WHERE id = 1")
  end

  def alter_hp(hp, db = @db)
    self.id = id
    db.execute("UPDATE pokemon SET hp = ? where id = ?", hp, id)
  end
end
