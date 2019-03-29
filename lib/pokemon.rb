require 'pry'
class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id:, name:, type:, db:, hp: nil)
   @id = id
   @name = name 
   @type = type 
   @db = db
   @hp = hp 
  end
  
  def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", @id, name, type)
  end
  
  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon")
    new_pokemon.each do |creature|
      if creature[0] == id
        return self.new(id: creature[0], name: creature[1], type: creature[2], db: @db, hp: creature[3])
      end
    end 
  end
  
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = (?)", hp)
    #alter.execute(hp)
  end 
end
