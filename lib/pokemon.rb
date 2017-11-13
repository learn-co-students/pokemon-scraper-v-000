require "pry"
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(id = nil, name = nil, type = nil, db = nil, hp = 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def alter_hp(hp, db)
    @hp = hp
    db.execute("UPDATE pokemon SET hp =? WHERE id =?",@hp, self.id)
    #binding.pry
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    attributes = db.execute("SELECT * FROM pokemon WHERE id =?", id).flatten
    poke = Pokemon.new(attributes[0], attributes[1], attributes[2], db, attributes[3])
  end
end
