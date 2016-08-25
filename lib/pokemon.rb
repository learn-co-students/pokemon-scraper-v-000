class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id, name, type, db)
    @name = name
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = id")
  end

  def alter_hp(new_hp)
   db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
 end
 
end
