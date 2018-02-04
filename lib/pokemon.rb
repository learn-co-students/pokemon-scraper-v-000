class Pokemon
#=====================================
  attr_accessor :id, :name, :type, :hp, :db
#=====================================  
  def initialize(attr_hash) 
    attr_hash.each{|k, v| self.send(("#{k}="), v)}
    @hp = 60
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?,?)", name, type)
  end
  
  def self.find(id, db) 
    row = db.execute("SELECT * FROM Pokemon WHERE id = ?", id).flatten
    Pokemon.new({id: row[0], name: row[1], type: row[2], db: db})
  end
  
  def alter_hp(hp, db)
    binding.pry
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
#=====================================
end
