require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  
  def initialize (id:, name:, type:, db:, hp: nil)
    @id = id #primary key for object
    @name = name
    @type = type
    @hp = nil
    @db = db
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.save(name, type, db)
    #saving multiple pokemon objects to the database
    #class methods do not have instance variables
    #binding.pry
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
    pokemon = Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
  end
  
  # def 
  #   db.execute("ALTER TABLE pokemon ADD COLUMN hp INTEGER DEFAULT(60)")
  # end
end
 