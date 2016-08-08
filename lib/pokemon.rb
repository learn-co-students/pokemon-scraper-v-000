class Pokemon

  attr_accessor :id, :name, :type, :hp, :db 

  def initialize(id, name, type, db)
     @id, @name, @type, @hp = id, name, type, hp
     @db = db 

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT id, name, type FROM pokemon")
  end

  def self.alter_hp(id, new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
  end

end
