require 'pry'
class Pokemon

  attr_accessor :name, :type, :db, :id

  @@all = []

  def initialize(id = nil, name = nil, type = nil, db = nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
  row = db.execute("SELECT name, type FROM Pokemon WHERE id = (?)", id)
  name = row.join(",").split(",")[0]
  type = row.join(",").split(",")[1]
  #hp = row.join(",").split(",")[2]
  Pokemon.new(id, name, type, db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", new_hp, self.id)
  end

end
