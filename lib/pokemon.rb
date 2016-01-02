require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id, name, type, db)
    @id = id
    @name = name 
    @type = type
  end 

  def self.save(name, type, db) 
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type )
  end 

  def self.find(id, db)
    db.execute('SELECT id, name, type FROM pokemon WHERE id = ?', id).flatten
  end 

end
