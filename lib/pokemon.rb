require 'pry'

class Pokemon
  attr_reader :id, :name, :type, :db, :hp

  def initialize(id, name: nil, type: nil, db: nil, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end
  
  def alter_hp(hp, db)
    @hp = hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", hp, id)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    x = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).first
    Pokemon.new(x[0], name: x[1], type: x[2], hp: x[3])
  end
end
