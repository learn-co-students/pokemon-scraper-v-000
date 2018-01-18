require 'pry'

class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    # is initialized with arguments - name, type and db
    @name = name 
    @type = type
    @db = db
    @id = id
  end 
  
  def self.save(name, type, db)
   # saves an instance of Pokemon class into the database 
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end 
  
  def self.find(id, db)
    # The find method creates a new Pokemon after selecting their row from the database by their id number
  end
  
end
