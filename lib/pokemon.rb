class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  
  
  def initialize(name, type, id, db)  
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
    
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type) 
  end

  def self.find(id, db)
    db.execute("SELECT id, name, type FROM pokemon;")
  end

  def alter_hp(new_hp)
   db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
  end
end
