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
    poks = db.execute("SELECT * FROM pokemon WHERE id = ?", [id]).flatten
    self.new(@id = poks[0], @name = poks[1], @type = poks[2], @hp = poks[3])
  end

  def alter_hp(new_hp,db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
