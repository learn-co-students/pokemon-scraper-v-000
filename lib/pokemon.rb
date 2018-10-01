require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp  

  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type
    @db = db 
  end

  def self.save(name, type, db)
    statement = db.prepare("INSERT INTO pokemon (name, type) VALUES (?,?)")
    statement.execute(name,type)
  end

  def self.find(id, db)
    statement = db.prepare("SELECT * FROM pokemon WHERE id = ?")
    result_set = statement.execute(id)
    
    results = result_set.collect do |row|
      pokemon = Pokemon.new(name: row[1], type: row[2], db: db, id: id)
      pokemon.hp = row[3]
      pokemon
    end
    results[0]
  end
end 