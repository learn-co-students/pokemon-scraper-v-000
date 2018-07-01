class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id:, name:, type:, db:, hp: nil)
    self.id = id
    self.name = name 
    self.type = type 
    self.db = db
    self.hp = hp
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end 
  
  def self.find(id, db)
    attributes_array = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    name = attributes_array[1]
    type = attributes_array[2]
    hp = attributes_array[3]
    new(id: id, name: name, type: type, db: db, hp: hp)
  end
  
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", hp, self.name)
  end
  
end
