require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp
  @@all = []


  def initialize(id=nil, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);",name, type)
    self.new(db.execute("SELECT * FROM pokemon WHERE name = ?", name).flatten[0], db.execute("SELECT * FROM pokemon WHERE name = ?", name).flatten[1], db.execute("SELECT * FROM pokemon WHERE name = ?", name).flatten[2], db)
  end

  def self.find(id, db)
    self.all.bsearch {|pokemon| pokemon.id == id}
  end

#  def BONUS
#    db.execute("ALTER TABLE pokemon ADD hp INTEGER;")
#    db.execute("INSERT INTO pokemon (hp) VALUES (?);", @hp)
#  end

end
