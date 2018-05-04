class Pokemon
  
  attr_accessor :name, :type, :db, :id
  
  @@all = []
  
  def initialize(db)
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id) 
    
  end
  
  
end
