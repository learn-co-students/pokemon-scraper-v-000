require 'pry'
class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
   @id = id
   @name = name 
   @type = type 
   @db = db 
  end
  
  def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", @id, name, type)
  end
  
  def self.find(id, db)
    new_pokemon = db.execute("SELECT id, name, type FROM pokemon")
    new_pokemon.each do |creature|
      if creature[0] == id
       # binding.pry 
        return self.new(id: creature[0], name: creature[1], type: creature[2], db: db)
      end
    end 
  end 
end
