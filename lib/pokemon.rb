require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  
  def initialize (id:, name:, type:, db:, hp: nil)
    @id = id #primary key for object
    @name = name
    @type = type
    @hp = hp
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
    pokemon = Pokemon.new(id: row[0], name: row[1], type: row[2], db: db, hp: row[3])
  end
  
  def alter_hp(new_hp, db)
    row = Pokemon.find(id, db)
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = (?)", id)
    db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
  end
end