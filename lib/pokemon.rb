class Pokemon
  
  attr_accessor :id, :name, :type, :db 
  
  def initialize
    @id = id 
    @name = name
    @type = type
    @db = db
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end 
  
  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    db.execute(sql, id, db)
  end 

end

