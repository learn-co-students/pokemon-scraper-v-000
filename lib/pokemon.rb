class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id, name, type, db)
    @name = name
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", id)
  end

  def self.alter_hp(hp, id, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE ID = ?", hp, id)
  end
end
