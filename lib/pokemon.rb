require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db
  
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
  
end
