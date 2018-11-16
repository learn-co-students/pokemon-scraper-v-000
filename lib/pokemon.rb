class Pokemon
  
  #attr_accessor :id, :name, :type, :db 
  
  @@all = []
  
  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self 
  end
  
  def self.save(id, name, type, db) 
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?,?,?)", [id, name, type])
  end 
  
  def self.find(id)
    db.execute("SELECT * FROM pokemon WHERE pokemon.id = ", [id])
  end 
  
end


