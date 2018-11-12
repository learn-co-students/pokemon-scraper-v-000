require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  @@all = []
  
  def initialize(id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name 
    @type = type
    @db = db
    @hp = hp
    self.class.all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",[name, type])
  end 
  
  def self.find(id, database_connection)
    array = database_connection.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", id).flatten
    self.new(id: array[0], name: array[1], type: array[2], db: database_connection, hp: array[3]) 
  end 
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE pokemon.id = (?)", [new_hp, self.id])
  end 
    
end
