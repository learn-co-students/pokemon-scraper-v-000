class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", @id, name, type)
  end

  def self.find(id, db)
    db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id)
  end

  def alter_hp(updated_hp)
    db.execute("UPDATE table pokemon SET hp = ? WHERE id = ?", updated_hp, id)
  end
end
