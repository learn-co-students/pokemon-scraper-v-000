class Pokemon

  attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  
  def initialize(keywords)
    
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    poke_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    new_poke = self.new(poke_info)
    new_poke.id = poke_info[0][0]
    new_poke.name = poke_info[0][1]
    new_poke.type = poke_info[0][2]
    new_poke.hp = poke_info[0][3]
    return new_poke
  end
  
  def alter_hp(num, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", num, self.id)
    self.hp = num
  end
end
