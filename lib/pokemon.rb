require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize(id = nil, name = nil, type = nil, db = nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    poks = db.execute("SELECT * FROM pokemon WHERE id = ?", [id])
    poksinner = poks[0]
    poksinner[0]
    self.new(@id = poksinner[0], @name = poksinner[1], @type = poksinner[2])
  end


end
