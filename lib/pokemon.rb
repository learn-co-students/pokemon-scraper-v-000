class Pokemon
  attr_accessor :name, :type, :db 
  @@all = []
  
  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.all
    @@all
  end 

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)",@id, name, type)
  end

  def self.find(id, db)
    db.execute("SELECT id, name, type FROM pokemon WHERE id=?", id)[0]
  end

end 