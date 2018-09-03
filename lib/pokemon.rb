require 'pry'
class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  # @@all = []
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

    
   def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
   end
    
    def self.find(id, db)

      # pokemon_new = db.execute("SELECT * FROM pokemon WHERE id = ?", [id_num])
    
      # Pokemon.new(id: pokemon_new[0], name: pokemon_new[1], type: pokemon_new[2], db: db) 
      
      	
    pokemon = db.execute("SELECT * FROM Pokemon WHERE id = ?", [id]).first
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
  end

 end