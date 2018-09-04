require 'pry'
class Pokemon
  
  attr_accessor :id, :name, :type, :hp, :db
  
  # @@all = []
  
  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end
    
   def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
   end
    
    def alter_hp(hp, db)
      db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
    end
    
    def self.find(id, db)
      pokemon = db.execute("SELECT * FROM Pokemon WHERE id = ?", [id]).first
      
      Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)
     end

 end