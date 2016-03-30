require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id,name,type,db)
    @id, @name, @type = id, name, type
    @db = db
  end

  def self.save(n,t,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)", n,t)
  end 

  def self.find(id,db) 
    db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
  end
end
