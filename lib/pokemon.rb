require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  
  @@all = []
  
  def initialize(name: name, type: type, db: db, id: id, hp: hp)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end
 
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
 def self.find(id, db)
    pokarray = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    Pokemon.new(id: pokarray[0], name: pokarray[1], type: pokarray[2], hp: pokarray[3])
 end
 
 def alter_hp(new_hp, db)
   db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
 end
  
end