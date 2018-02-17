class Pokemon
  attr_accessor :id, :name, :type, :db 
  @@all = []
  
  def initialize(name: name, type: type, db: db, id: nil)
    @name = name
    @type = type
    @id = id
    @db = db
  end 

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id, db)
    np = db.execute("SELECT * FROM pokemon WHERE id = id;")
    self.new(name: np[0][1], type: np[0][2], db: db, id: id)
    #binding.pry
  end 
  
end
