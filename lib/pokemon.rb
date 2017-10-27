require 'pry'
class Pokemon
  attr_accessor :name, :type, :db 
  attr_reader :id
  def initialize(name:, type:, db:, id:)
    @id = id
    @name = name
    @type = type
    @db = db
    # binding.pry
  end

  def self.save(name, type, db)
   db.execute( "INSERT INTO pokemon (name, type) VALUES (?, ?) ",name, type)
  end

  def self.find(id, db)
   new_from_find = db.execute("SELECT * FROM  pokemon  WHERE id = (?)",id)
  
   hash_from_find = {
   name: new_from_find[0][1],
   type: new_from_find[0][2],
   db: db,
   id: new_from_find[0][0]
  }
  

   Pokemon.new(hash_from_find)
  end

end
