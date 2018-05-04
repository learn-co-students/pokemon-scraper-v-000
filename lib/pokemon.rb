class Pokemon
  
  attr_accessor :name, :type, :db, :id
  
  @@all = []
  
  def initialize(db)
    @db = db
    @id = id
    @name = name
    @type = type
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db) 
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
     binding.pry
  end
  
  
end
