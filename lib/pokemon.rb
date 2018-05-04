class Pokemon
  
  attr_accessor :name, :type, :db, :id
  
  @@all = []
  
  def initialize(db)
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?, ?)",name, breed, age)
  end
  
end
