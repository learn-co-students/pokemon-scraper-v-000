require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(id = nil, name = nil, type = nil, db = nil, hp)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    poks = db.execute("SELECT * FROM pokemon WHERE id = ?", [id])
    poksinner = poks[0]
    poksinner[0]
    self.new(@id = poksinner[0], @name = poksinner[1], @type = poksinner[2], @hp = poksinner[3])
  end

  def alter_hp(new_hp,db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
