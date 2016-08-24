require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon;")
  end

  def knows_default_hp
    db.execute("SELECT hp FROM pokemon;")
  end

  def alter_hp(health)
    db.execute("UPDATE pokemon SET hp = ?", health)
  end

end
