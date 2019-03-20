require "pry"
class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id=1, name="Pokemon", type="electric", db=@db)
    @id = id
    @name = name
    @type = type 
    @db = db
  end 
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id, db)
    x = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    Pokemon.new(x[0][0],x[0][1],x[0][2])
  end

end
