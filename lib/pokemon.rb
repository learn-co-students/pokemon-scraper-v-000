require 'pry'

class Pokemon

attr_accessor :db, :id, :type, :name, :hp

  def initialize(db, id = "", type = "", name = "") #, hp = nil) #tests were very unclear. Needed these stupid arguments, not just db.
    #@hp = hp
    @db = db
    @id = id
    @type = type
    @name = name
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type);
  end

  def self.find(id, db)
    pok = db.execute("SELECT * from pokemon where id = id"); #binding.pry
    Pokemon.new(@db = db, id = pok[0][0], type = pok[0][2], name = pok[0][1])#, hp = pok[0][3]) #apparently the order mattered -_-
  end
end
