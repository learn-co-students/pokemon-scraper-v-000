class Pokemon 
  attr_accessor :id, :name, :type, :db, :hp
  
  @@all = []

def initialize(id:, name:, type: , hp: 60 , db:)
  @id = id 
  @name = name 
  @type = type
  @db = db
  @hp = hp
  @@all << self
  
end 

def self.save(name, type, db)
  db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
end 
def self.find(id,db)
  result = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id ).flatten
  
  self.new(id: result[0],name: result[1], type: result[2], hp: result[3], db: db) 
end 
def alter_hp(new_hp,db)
  db.execute(" UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
end 
  
 

 
  
end 

