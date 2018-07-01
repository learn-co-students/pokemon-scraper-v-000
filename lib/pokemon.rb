class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    self.id = id
    self.name = name 
    self.type = type 
    self.db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end 
  
  def self.find(id, db)
    attributes_array = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    name = attributes_array[1]
    type = attributes_array[2]
    new(id: id, name: name, type: type, db: db)
  end
  
end
