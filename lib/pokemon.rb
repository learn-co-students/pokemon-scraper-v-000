require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize (id = nil, name = nil, type = nil, hp = nil, db = nil )
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    attributes = db.execute("SELECT * FROM pokemon WHERE id = id;").flatten
    Pokemon.new(attributes[0],attributes[1], attributes[2], attributes[3])
    # binding.pry
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

end
