require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id, db)
    query = db.execute("SELECT name, type FROM pokemon WHERE id = ?", id)
    query = query.flatten
    new_pokemon = Pokemon.new(name: query[0], type: query[1], id: id, db: db)
  end 
  
  def alter_hp(new_health, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_health, @id)
    query = db.execute("SELECT hp FROM pokemon WHERE id = ?", @id)
    @hp = query.flatten
  end
  
end
