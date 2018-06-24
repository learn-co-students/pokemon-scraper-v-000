class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  def initialize(id:, name:, type:, db:, hp: NIL)
    @id = id
    @name = name
    @type = type
    @hp = 60
    @db = db
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    name  = db.execute("SELECT name FROM pokemon WHERE id = ?", id).flatten[0]
    type  = db.execute("SELECT type FROM pokemon WHERE id = ?", id).flatten[0]
    self.new(id: 1, name: name, type: type, db: db, hp: 60)
  end 
    
end
