class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id, name: nil, type: nil, db: db)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(num, db)
    find_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
  end  
  
  
  
end
