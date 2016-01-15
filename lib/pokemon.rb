class Pokemon
  attr_accessor :name, :type, :db
  
  @@all = []
  
  def initialize(id=Pokemon.all.size+1,name, type, db)
    @id = id
    name = name
    type = type
    db = db
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.save(name, type, db)
    ins = db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?)")
    ins.execute(name, type)
  end
  
  def self.find(id, db)
    sel = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    sel.flatten
  end
    
end
