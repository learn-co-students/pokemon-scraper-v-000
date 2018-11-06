require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db 
  
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type 
    @db = db 
  end 

  def self.save (name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end 

  def self.find(id, database_connection)

     poke = database_connection.execute("SELECT id, name, type from pokemon  Where id=#{id}")
     Pokemon.new(id: poke[0][0], name: poke[0][1], type: poke[0][2], db: database_connection)
    
  end 

end
