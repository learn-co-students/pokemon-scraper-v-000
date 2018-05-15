require 'pry'

class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp  
   
 def initialize(name, type=nil, id=nil, hp=60)
  @name = name
  @type = type 
  @id = id 
  @hp = hp
 end 

  def self.save(name, type, db) 
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end 
  
  def self.find(id, db)
    begin 
      query = db.execute("SELECT name, type, id, hp FROM pokemon where id = ?;", id).flatten
      pokemon = Pokemon.new(query[0], query[1], query[2], query[3])
    rescue
      query = db.execute("SELECT name, type, id FROM pokemon where id = ?;", id).flatten
        pokemon = Pokemon.new(query[0], query[1], query[2])
    end 
  end 
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", new_hp, self.id)
  end 
end
