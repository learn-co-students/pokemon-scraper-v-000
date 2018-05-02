class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  def initialize(id = nil, name = nil, type = nil, hp = nil)
    @name = name
    @type = type
    @id = id
    @hp = hp
  end
  
 def self.save(name, type, db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    q = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(q[0], q[1], q[2], q[3])
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
  
end

